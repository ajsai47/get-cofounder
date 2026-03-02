# Settings & Permissions Guide

How to configure Claude Code's `.claude/settings.json` for optimal Cofounder operation. Settings control which tools each department can access, what requires human approval, and how hooks enforce quality.

---

## Settings File Hierarchy

Claude Code loads settings from multiple sources, with later sources overriding earlier ones:

1. **Managed policy** -- Organization-level settings (cannot be overridden)
2. **User settings** -- `~/.claude/settings.json` (global, all projects)
3. **Project settings** -- `.claude/settings.json` (shared, committed to git)
4. **Local settings** -- `.claude/settings.local.json` (personal, git-ignored)

For Cofounder, configure project settings in `.claude/settings.json` and let individual users override in `.claude/settings.local.json`.

---

## Permission Patterns

Permissions follow a three-tier model: `allow` (no prompt), `ask` (prompt user), and `deny` (blocked entirely). The format uses tool names with optional glob patterns for arguments.

### Core Permissions (All Departments)

These permissions are safe for all Cofounder agents and should always be allowed:

```json
{
  "permissions": {
    "allow": [
      "Read(*)",
      "Glob(*)",
      "Grep(*)",
      "WebSearch",
      "Edit(.cofounder/**)",
      "Write(.cofounder/**)"
    ]
  }
}
```

### Permission Patterns by Department

Each department needs different tool access. Configure these in the settings.json `allow` array, and restrict dangerous operations in `deny` or `ask`.

| Department | Allow | Ask (Prompt User) | Deny |
|-----------|-------|-------------------|------|
| Engineering | `Bash(npm *)`, `Bash(npx *)`, `Bash(node *)`, `Bash(git *)`, `Bash(python3 *)`, `Edit(src/**)`, `Write(src/**)` | `Bash(git push *)`, `Bash(git reset *)` | `Bash(rm -rf *)`, `Bash(sudo *)`, `Bash(chmod 777 *)` |
| Marketing | `WebFetch(domain:*)`, `WebSearch`, `Write(.cofounder/context/voice.md)`, `Write(content/**)`, `Edit(content/**)` | -- | `Bash(*)` (except explicitly allowed) |
| Design | `Edit(src/components/**)`, `Write(src/components/**)`, `Edit(src/styles/**)` | `Write(public/**)` | `Bash(*)`, `WebFetch(*)` |
| Operations | `Bash(curl *)`, `WebFetch(domain:*)`, `Read(*)` | `Bash(docker *)` | `Write(src/**)`, `Bash(rm *)` |
| Product | `Read(*)`, `WebSearch`, `WebFetch(domain:*)` | -- | `Write(src/**)`, `Bash(*)` |
| Testing | `Bash(npm test *)`, `Bash(npx jest *)`, `Bash(npx vitest *)`, `Read(*)`, `Grep(*)` | `Bash(npm run *)` | `Write(src/**)`, `Edit(src/**)` |
| Memory | `Read(.cofounder/**)`, `Write(.cofounder/memory/**)`, `Edit(.cofounder/memory/**)` | -- | `Bash(*)`, `Write(src/**)` |
| Validation | `Read(*)`, `Grep(*)`, `Glob(*)` | -- | `Write(*)`, `Edit(*)`, `Bash(*)` |

### Dangerous Commands to Always Restrict

These should always be in the `deny` or `ask` array:

```json
{
  "permissions": {
    "deny": [
      "Bash(rm -rf /)",
      "Bash(sudo *)",
      "Bash(mkfs *)",
      "Bash(dd *)",
      "Bash(chmod 777 *)",
      "Bash(> /dev/*)"
    ],
    "ask": [
      "Bash(rm *)",
      "Bash(rmdir *)",
      "Bash(git push *)",
      "Bash(git reset --hard *)",
      "Bash(git checkout -- *)",
      "Bash(npm publish *)",
      "Bash(docker *)",
      "Bash(kill *)",
      "Bash(killall *)",
      "Bash(curl * | bash)",
      "Bash(wget * | bash)"
    ]
  }
}
```

---

## Model Selection per Agent Type

Different agents have different intelligence needs. Using a smaller model for simple tasks saves cost and increases speed.

| Agent Type | Recommended Model | Why |
|-----------|------------------|-----|
| code-reviewer | `opus` | Deep analysis of code quality, security, architecture |
| constitutional-validator | `opus` | Critical judgment calls on brand, compliance, scope |
| backend-architect | `opus` | System design requires deep reasoning |
| ai-engineer | `opus` | ML integration needs nuanced technical judgment |
| rapid-prototyper | `sonnet` | Speed over depth -- get working code fast |
| frontend-developer | `sonnet` | UI work benefits from balance of quality and speed |
| content-creator | `sonnet` | Good writing quality without opus cost |
| social-strategist | `sonnet` | Creative work at reasonable speed |
| trend-researcher | `sonnet` | Research tasks with web search need current info |
| analytics-reporter | `haiku` | Mostly data formatting and summarization |
| context-keeper | `haiku` | Memory indexing is structured, not creative |
| support-responder | `sonnet` | Customer-facing requires quality, not maximum depth |
| brand-guardian | `opus` | Brand consistency is a critical quality gate |
| test-engineer | `sonnet` | Test writing is structured but needs good coverage thinking |

Set model in agent frontmatter:
```yaml
---
name: analytics-reporter
model: haiku
---
```

Or in settings.json for the default:
```json
{
  "model": "sonnet"
}
```

---

## Hook Configuration

Point hooks to the `.cofounder/hooks/` directory where hook scripts live. See `hooks-system.md` for the full hook reference.

### Recommended Hook Setup

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
            "timeout": 3000,
            "statusMessage": "Checking brand voice..."
          }
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/.cofounder/hooks/security-check.sh",
            "timeout": 2000,
            "statusMessage": "Security scan..."
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
            "async": true,
            "statusMessage": "Capturing learnings..."
          }
        ]
      }
    ]
  }
}
```

### Making Hooks Async vs Sync

- **Sync (default)**: Hook must complete before the tool call proceeds. Use for gates that should block (security-check, brand-check).
- **Async (`"async": true`)**: Hook runs in the background. Use for side effects that should not slow down work (memory-capture, audit-log, notifications).

---

## Sandbox Configuration

### When to Enable Sandbox

Enable sandbox mode when agents process untrusted inputs or make external API calls:

- Running user-submitted code or scripts
- Processing data from external APIs where content is not controlled
- Agents with broad Bash access that could accidentally modify system files

### File Isolation Patterns

Restrict Write/Edit to specific directories per department to prevent cross-contamination:

```json
{
  "permissions": {
    "allow": [
      "Write(.cofounder/**)",
      "Write(src/components/**)",
      "Write(content/**)"
    ],
    "deny": [
      "Write(.env*)",
      "Write(*.pem)",
      "Write(*.key)",
      "Write(.git/**)",
      "Write(node_modules/**)"
    ]
  }
}
```

### Network Restrictions

For agents that should not make network requests (Design, Validation), deny all Bash and WebFetch:

```json
{
  "permissions": {
    "deny": [
      "Bash(curl *)",
      "Bash(wget *)",
      "WebFetch(*)"
    ]
  }
}
```

---

## Environment Variables

Pass configuration to agents and hooks via the `env` field. Never hardcode secrets in agent prompts or CLAUDE.md.

```json
{
  "env": {
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "80",
    "COFOUNDER_LOG_LEVEL": "info",
    "COFOUNDER_HOOKS_DIR": ".cofounder/hooks"
  }
}
```

### Secret Management

Secrets (API keys, tokens, credentials) should be:
1. Stored in `.env` files (git-ignored)
2. Referenced via environment variables in hooks and scripts
3. Never written into settings.json, CLAUDE.md, or agent prompts

The `security-check` hook enforces this by scanning for common secret patterns before any Bash command executes.

---

## Additional Settings

### Output Style

Control how agents format their responses:

```json
{
  "outputStyle": "concise"
}
```

Options: `"concise"`, `"verbose"`, `"explanatory"`. For solofounder use, `"concise"` is recommended -- you want answers, not essays.

### Autocompact

Set the context usage threshold for automatic compaction:

```json
{
  "env": {
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "80"
  }
}
```

At 80% context usage, Claude Code automatically compacts the conversation. This prevents mid-task context loss. For complex multi-department work, consider manual `/compact` at ~50%.

### Plans Directory

Where planning mode saves its outputs:

```json
{
  "plansDirectory": ".cofounder/plans"
}
```

### Attribution

How Claude Code signs commits and PRs:

```json
{
  "attribution": {
    "commit": "Co-Authored-By: Cofounder AI <noreply@cofounder.dev>",
    "pr": "Generated with Cofounder AI"
  }
}
```

### Gitignore Respect

Always keep this enabled to prevent agents from reading or writing to ignored files:

```json
{
  "respectGitignore": true
}
```

---

## Example Full Settings

A complete, production-ready `.claude/settings.json` for a Cofounder-powered project. Copy this to your project and adjust paths.

See `templates/settings.json` for the ready-to-copy version.

The key principles:
1. **Allow reads everywhere** -- agents need context to do good work
2. **Restrict writes by directory** -- each department writes to its own domain
3. **Gate dangerous operations** -- destructive commands always prompt the user
4. **Deny known-bad patterns** -- secrets, system files, and destructive commands are hard-blocked
5. **Use hooks for enforcement** -- settings define permissions, hooks enforce quality standards
