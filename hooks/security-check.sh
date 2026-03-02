#!/usr/bin/env bash
#
# security-check.sh — PreToolUse hook for Cofounder
#
# Scans Bash command arguments and file content for common security issues:
# - API keys and tokens
# - Hardcoded credentials and passwords
# - Private keys and certificates
# - Common secret patterns (AWS, GitHub, Stripe, etc.)
#
# Input: JSON on stdin with tool_name, tool_input (command or content)
# Output: JSON on stdout with permissionDecision (allow/deny)
# Exit 0: Hook completed (decision is in the JSON output)
#
# Install: Add to .claude/settings.json under hooks.PreToolUse with matcher "Bash"
# Also works with matcher "Write|Edit" to scan file content before writing.

set -euo pipefail

# Read the full JSON input from stdin
INPUT=$(cat)

# Extract the tool name to determine what to scan
TOOL_NAME=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(data.get('tool_name', ''))
" 2>/dev/null || echo "")

# Extract the text to scan based on the tool type
TEXT_TO_SCAN=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
tool_input = data.get('tool_input', {})
tool_name = data.get('tool_name', '')

if tool_name == 'Bash':
    # For Bash, scan the command string
    print(tool_input.get('command', ''))
elif tool_name in ('Write', 'Edit'):
    # For Write/Edit, scan the content or new_string
    content = tool_input.get('content', tool_input.get('new_string', ''))
    print(content)
else:
    print('')
" 2>/dev/null || echo "")

# If nothing to scan, allow
if [ -z "$TEXT_TO_SCAN" ]; then
  echo '{"hookSpecificOutput": {"permissionDecision": "allow"}}'
  exit 0
fi

# Define secret patterns to detect.
# Each pattern is a regex paired with a human-readable description.
# These cover the most common leaked secret formats.
PATTERNS=(
  # AWS
  'AKIA[0-9A-Z]{16}:AWS Access Key ID'
  # GitHub personal access token (classic and fine-grained)
  'ghp_[A-Za-z0-9]{36}:GitHub Personal Access Token'
  'github_pat_[A-Za-z0-9_]{82}:GitHub Fine-Grained Token'
  # Stripe
  'sk_live_[A-Za-z0-9]{24,}:Stripe Live Secret Key'
  'rk_live_[A-Za-z0-9]{24,}:Stripe Live Restricted Key'
  # Slack
  'xoxb-[0-9]{11,}-[A-Za-z0-9]{24,}:Slack Bot Token'
  'xoxp-[0-9]{11,}-[A-Za-z0-9]{24,}:Slack User Token'
  # Generic patterns
  'sk-ant-api[A-Za-z0-9_-]{40,}:Anthropic API Key'
  'sk-[A-Za-z0-9]{48,}:OpenAI API Key'
  # Private keys
  '-----BEGIN (RSA |EC |DSA |OPENSSH )?PRIVATE KEY-----:Private Key'
  '-----BEGIN CERTIFICATE-----:Certificate'
  # Generic secret assignments (catches most hardcoded secrets)
  'password\s*[=:]\s*["\x27][^"\x27]{8,}:Hardcoded Password'
  'secret\s*[=:]\s*["\x27][^"\x27]{8,}:Hardcoded Secret'
  'api_key\s*[=:]\s*["\x27][^"\x27]{8,}:Hardcoded API Key'
  'apikey\s*[=:]\s*["\x27][^"\x27]{8,}:Hardcoded API Key'
  'token\s*[=:]\s*["\x27][^"\x27]{16,}:Hardcoded Token'
  'Bearer [A-Za-z0-9_-]{20,}:Bearer Token in Code'
)

# Scan text against each pattern
FOUND_ISSUES=""
for ENTRY in "${PATTERNS[@]}"; do
  PATTERN="${ENTRY%%:*}"
  DESCRIPTION="${ENTRY#*:}"

  if echo "$TEXT_TO_SCAN" | grep -qEi "$PATTERN" 2>/dev/null; then
    if [ -z "$FOUND_ISSUES" ]; then
      FOUND_ISSUES="$DESCRIPTION"
    else
      FOUND_ISSUES="$FOUND_ISSUES; $DESCRIPTION"
    fi
  fi
done

# Additional check: scanning for .env file access in Bash commands
if [ "$TOOL_NAME" = "Bash" ]; then
  if echo "$TEXT_TO_SCAN" | grep -qE 'cat\s+\.env|source\s+\.env|cat\s+.*\.env|echo.*>.*\.env' 2>/dev/null; then
    if [ -z "$FOUND_ISSUES" ]; then
      FOUND_ISSUES="Direct .env file manipulation"
    else
      FOUND_ISSUES="$FOUND_ISSUES; Direct .env file manipulation"
    fi
  fi
fi

# Return decision
if [ -n "$FOUND_ISSUES" ]; then
  ESCAPED=$(echo "$FOUND_ISSUES" | sed 's/"/\\"/g')
  cat <<EOF
{
  "hookSpecificOutput": {
    "permissionDecision": "deny",
    "permissionDecisionReason": "Security violation detected: ${ESCAPED}. Never hardcode secrets in code or commands. Use environment variables from .env files (git-ignored) or a secrets manager. Reference secrets via process.env.VAR_NAME in code."
  }
}
EOF
  exit 0
else
  echo '{"hookSpecificOutput": {"permissionDecision": "allow"}}'
  exit 0
fi
