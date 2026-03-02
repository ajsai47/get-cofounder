#!/usr/bin/env bash
#
# brand-check.sh — PreToolUse hook for Cofounder
#
# Validates that content being written to marketing, content, or voice files
# does not contain words from the "Words We Never Use" list in voice.md.
#
# Input: JSON on stdin with tool_name, tool_input (file_path, content)
# Output: JSON on stdout with permissionDecision (allow/deny)
# Exit 0: Hook completed (decision is in the JSON output)
#
# Install: Add to .claude/settings.json under hooks.PreToolUse with matcher "Write|Edit"

set -euo pipefail

# Read the full JSON input from stdin
INPUT=$(cat)

# Extract the file path being written to
FILE_PATH=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
tool_input = data.get('tool_input', {})
print(tool_input.get('file_path', tool_input.get('file', '')))
" 2>/dev/null || echo "")

# Only check content-related files. Skip source code, config, etc.
# Match: content/, blog/, marketing/, social/, voice.md, brand.md, *.md in root
case "$FILE_PATH" in
  */content/*|*/blog/*|*/marketing/*|*/social/*|*voice.md|*brand.md)
    # This is a content file — proceed with brand check
    ;;
  *)
    # Not a content file — allow without checking
    echo '{"hookSpecificOutput": {"permissionDecision": "allow"}}'
    exit 0
    ;;
esac

# Extract the content being written
CONTENT=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
tool_input = data.get('tool_input', {})
content = tool_input.get('content', tool_input.get('new_string', ''))
print(content.lower())
" 2>/dev/null || echo "")

# If no content found, allow (might be a read or delete operation)
if [ -z "$CONTENT" ]; then
  echo '{"hookSpecificOutput": {"permissionDecision": "allow"}}'
  exit 0
fi

# Default banned words — common corporate speak that kills authentic voice.
# These are overridden by the project's voice.md "Words We Never Use" section.
# Add or remove words based on your brand guidelines.
BANNED_WORDS=(
  "leverage"
  "synergy"
  "synergize"
  "circle back"
  "paradigm"
  "disruptive"
  "thought leader"
  "best-in-class"
  "move the needle"
  "low-hanging fruit"
  "wheelhouse"
  "bandwidth"
  "deep dive"
  "game-changer"
  "revolutionary"
  "world-class"
  "cutting-edge"
  "next-generation"
  "bleeding-edge"
  "empower"
  "holistic"
  "robust"
  "scalable solution"
  "value-add"
  "actionable insights"
)

# Check content against each banned word
FOUND_VIOLATIONS=""
for WORD in "${BANNED_WORDS[@]}"; do
  if echo "$CONTENT" | grep -qi "$WORD"; then
    if [ -z "$FOUND_VIOLATIONS" ]; then
      FOUND_VIOLATIONS="$WORD"
    else
      FOUND_VIOLATIONS="$FOUND_VIOLATIONS, $WORD"
    fi
  fi
done

# Return decision
if [ -n "$FOUND_VIOLATIONS" ]; then
  # Escape the violations string for JSON
  ESCAPED=$(echo "$FOUND_VIOLATIONS" | sed 's/"/\\"/g')
  cat <<EOF
{
  "hookSpecificOutput": {
    "permissionDecision": "deny",
    "permissionDecisionReason": "Brand voice violation: content contains banned words: ${ESCAPED}. Check .cofounder/context/voice.md for approved alternatives. Remove or replace these words before writing."
  }
}
EOF
  exit 0
else
  echo '{"hookSpecificOutput": {"permissionDecision": "allow"}}'
  exit 0
fi
