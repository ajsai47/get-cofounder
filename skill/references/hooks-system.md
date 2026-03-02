# Hooks System

Pre/post tool-use scripts that validate, gate, or augment agent work automatically. They run without agent intervention and enforce quality standards that no single agent should be responsible for.

---

## What Hooks Are

Hooks are scripts or prompts that Claude Code executes at specific points in the agent workflow. They act as automated guardrails: checking for brand violations before content is written, scanning for secrets before code is committed, running linters after files are modified, and capturing learnings when work completes.

The key distinction: **agents make judgment calls, hooks enforce rules.** An agent decides what to write. A hook checks whether what was written follows the brand voice. An agent writes code. A hook verifies no API keys leaked into it.

Hooks receive context via JSON on stdin (tool name, file path, arguments, session info) and return structured JSON on stdout. A return code of 0 means "proceed." Non-zero means "block" (with a reason).

---

## Hook Types for Cofounder

### PreToolUse Hooks

Run before an agent uses a tool. Can block the action before it happens.

| Hook | Trigger | What It Does |
|------|---------|-------------|
| `brand-check` | Before Write/Edit to content files (`voice.md`, marketing/, blog/, social/) | Scans content for words from the "Words We Never Use" list in `voice.md` |
| `scope-check` | Before Write/Edit to source code files | Validates the change is within the current sprint priorities defined in `state.md` |
| `security-check` | Before any Bash command execution | Scans command arguments for secrets, API keys, credentials, tokens |
| `voice-check` | Before Write/Edit to any user-facing copy | Checks tone and style against `voice.md` writing principles |
| `compliance-check` | Before Write/Edit to legal, terms, or privacy files | Flags changes that may have regulatory implications |

### PostToolUse Hooks

Run after a tool completes successfully. Can flag issues for review.

| Hook | Trigger | What It Does |
|------|---------|-------------|
| `lint-check` | After Write/Edit to `.js`, `.ts`, `.py`, `.jsx`, `.tsx` files | Runs the project linter on modified files |
| `test-check` | After Write/Edit to source files | Runs relevant test files (matched by naming convention) |
| `accessibility-check` | After Write/Edit to `.html`, `.jsx`, `.tsx` component files | Checks for common accessibility violations (missing alt, aria labels) |
| `analytics-tag-check` | After Write/Edit to marketing pages | Verifies analytics tags and tracking codes are present |
| `memory-capture` | After Stop (agent finishes major work) | Prompts the memory system to capture learnings from the completed session |
| `audit-log` | After any Write/Edit | Appends a timestamped entry to `.cofounder/logs/audit.jsonl` |

### Notification Hooks

Alert when specific events occur.

| Hook | Trigger | What It Does |
|------|---------|-------------|
| `deploy-alert` | When `/launch` command completes (Stop hook) | Logs deployment details, surfaces post-launch checklist |
| `review-needed` | After Write/Edit exceeds line-change threshold | Flags large changes for human review before merging |

---

## Department-Scoped Hooks

Each department has different risk profiles and quality needs. Hooks are scoped accordingly.

| Department | PreToolUse Hooks | PostToolUse Hooks |
|-----------|-----------------|-------------------|
| Engineering | `security-check`, `scope-check` | `lint-check`, `test-check` |
| Marketing | `brand-check`, `voice-check` | `analytics-tag-check` |
| Design | `brand-check`, `voice-check` | `accessibility-check` |
| Operations | `compliance-check` | `audit-log` |
| Product | -- | `memory-capture` |
| Testing | `security-check` | `lint-check` |
| All Departments | -- | `memory-capture` |

---

## Hook Configuration Format

Hooks are configured in the project's `.claude/settings.json` under the `hooks` key. Each hook event contains an array of hook groups, each with an optional `matcher` and an array of hook handlers.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/brand-check.sh",
            "timeout": 3000
          }
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/security-check.sh",
            "timeout": 2000
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/lint-check.sh",
            "timeout": 5000
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/memory-capture.sh",
            "timeout": 5000,
            "async": true
          }
        ]
      }
    ]
  }
}
```

### Matcher Syntax

Matchers use regex to filter which tool invocations trigger the hook:

- `"Write|Edit"` -- matches Write or Edit tool calls
- `"Bash"` -- matches only Bash tool calls
- `"mcp__.*"` -- matches any MCP tool call
- `"mcp__memory__.*"` -- matches any tool from the memory MCP server
- No matcher -- the hook fires on every invocation of that event type

### Hook Handler Types

**`type: "command"`** -- Runs a shell script. Best for deterministic checks (regex matching, file scanning, linting). Fast and predictable.

```json
{
  "type": "command",
  "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/security-check.sh",
  "timeout": 2000
}
```

**`type: "prompt"`** -- Sends a prompt to a Claude model for a single-turn judgment call. Best for nuanced checks that need reasoning (tone analysis, scope relevance). Returns `{"ok": true/false, "reason": "..."}`.

```json
{
  "type": "prompt",
  "prompt": "Check if this content matches the brand voice defined in .cofounder/context/voice.md. Content: $ARGUMENTS",
  "timeout": 30
}
```

**`type: "agent"`** -- Spawns a subagent with multi-turn tool access (Read, Grep, Glob). Best for complex verification that requires inspecting multiple files. Same response format as prompt hooks.

```json
{
  "type": "agent",
  "prompt": "Verify that all tests pass for files modified in this change. $ARGUMENTS",
  "timeout": 120
}
```

---

## Writing Custom Hooks

### File Location

Hook scripts live in `.cofounder/hooks/`. Each hook is a shell script (`.sh`) or a Node.js/Python script.

### Input Format

Every hook receives a JSON object on stdin with these fields:

```json
{
  "hook_event_name": "PreToolUse",
  "session_id": "abc-123",
  "tool_name": "Write",
  "tool_input": {
    "file_path": "/path/to/file.md",
    "content": "the content being written"
  },
  "cwd": "/Users/founder/project",
  "transcript_path": "/path/to/transcript.json",
  "permission_mode": "default"
}
```

For PostToolUse hooks, the input also includes `tool_response` with the tool's output.

### Output Format

Return JSON on stdout to communicate with Claude Code:

```json
{
  "hookSpecificOutput": {
    "permissionDecision": "deny",
    "permissionDecisionReason": "Content contains banned word 'synergy' (see voice.md)"
  }
}
```

**Decision values for PreToolUse:**
- `"allow"` -- approve the tool call, skip permission prompt
- `"deny"` -- block the tool call with the reason shown to the agent
- `"ask"` -- defer to the normal permission prompt

**Universal output fields (all hook types):**
- `"continue": false` -- stops the entire Claude session
- `"stopReason": "message"` -- shown when continue is false
- `"systemMessage": "warning"` -- warning shown to the user
- `"additionalContext": "info"` -- context injected into the conversation

### Exit Codes

- Exit 0: Hook ran successfully (output JSON determines allow/deny)
- Exit non-zero: Hook failed (treated as a soft error, does not block by default)

---

## Anti-Patterns

**Hooks that are too slow (>2s).** Hooks block agent work while they run. A brand-check that calls an external API adds latency to every file write. Keep hooks fast -- use local regex checks, not network calls. If a check is inherently slow, mark it `"async": true`.

**Hooks that are too strict.** A hook that blocks every file write unless it passes a 50-point brand checklist will prevent shipping. Hooks should catch clear violations (banned words, leaked secrets), not enforce stylistic preferences. Use agents for judgment, hooks for rules.

**Hooks that duplicate agent logic.** If the content-creator agent already follows voice.md, don't add a hook that re-checks every sentence against voice.md. Hooks should catch what agents miss -- the safety net, not the primary quality system.

**Hooks without clear error messages.** When a hook blocks an action, the agent sees only the reason string. "Brand violation detected" is useless. "Content contains 'leverage' -- banned word per voice.md, use 'use' instead" tells the agent exactly how to fix it.

**Hooks that modify files silently.** Hooks should validate, not mutate. If a hook auto-fixes code, the agent loses context about what changed. Flag the issue and let the agent fix it.

---

## Environment Variables

| Variable | Available In | Description |
|----------|-------------|-------------|
| `$CLAUDE_PROJECT_DIR` | All hooks | Project root directory |
| `$CLAUDE_ENV_FILE` | SessionStart only | File path for persisting env vars to Bash |
| `$CLAUDE_CODE_REMOTE` | All hooks | Set to `"true"` in remote environments |

---

## Disabling Hooks

**Disable all hooks** -- set in `.claude/settings.local.json` (git-ignored, per-user):
```json
{
  "disableAllHooks": true
}
```

**Disable individual hooks** -- create `.cofounder/hooks/config/hooks-config.local.json`:
```json
{
  "disableBrandCheck": true,
  "disableSecurityCheck": false
}
```

Local config overrides shared config, so each user can customize without affecting the team.

---

## Hook Lifecycle in a Typical Session

```
Founder: "Write a blog post about our new feature"

1. Cofounder routes to Marketing > content-creator
2. content-creator calls Read(.cofounder/context/voice.md)
   -> No PreToolUse hooks matched (Read is unrestricted)
3. content-creator calls Write(blog/new-feature.md, content)
   -> PreToolUse: brand-check.sh runs
   -> Scans content for banned words from voice.md
   -> Returns: {"hookSpecificOutput": {"permissionDecision": "allow"}}
   -> Write proceeds
   -> PostToolUse: analytics-tag-check runs
   -> Verifies og:tags and tracking scripts present
   -> Returns warning if missing
4. content-creator finishes
   -> Stop: memory-capture runs (async)
   -> Logs session summary to memory
```
