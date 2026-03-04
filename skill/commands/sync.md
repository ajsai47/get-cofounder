---
description: "Daily standup — all departments report, conflicts surface, priorities align"
argument-hint: "[quick|standard|deep]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/state.md` and `.cofounder/sync/latest.md` before proceeding.

# /sync — Daily Standup

Run all departments. Surface status, blockers, conflicts. Update state.

---

## Trigger

User invokes `/sync` or asks for a standup / status check.

---

## Process

### 1. Read Current State

Read `.cofounder/context/state.md` to understand current priorities and last known status.
Read `.cofounder/sync/latest.md` if it exists, for last standup context.

### 2. Run Department Check-Ins

For each active department, assess:
- **What shipped** since last sync
- **What's in progress** and estimated status
- **What's blocked** and what would unblock it
- **What needs attention** from other departments

Use sub-agents for departments that need deeper investigation. For departments with no active work, note "No active workstreams."

### 3. Surface Cross-Department Issues

Look for:
- **Conflicts** — departments working at cross-purposes
- **Dependencies** — work blocked by another department
- **Alignment gaps** — output inconsistent with context files
- **Context staleness** — context files that need updating

### 4. Check Decision Journal

Read the project-scope `decisions/journal.json` (`.cofounder/decisions/journal.json`) if it exists.

- **Recent Decisions:** Filter entries with `date` since last sync. These are decisions made since the last standup.
- **Pending Review:** Filter entries with `review_date` within the next 7 days and `status` of `active` or `revisit`. These need founder attention.

### 5. Synthesize Report

Present to the founder:

```markdown
# Sync — {date}

## Highlights
- {key accomplishments since last sync}

## Active Workstreams
### Engineering
- {status}
### Product
- {status}
### Marketing
- {status}
### Design
- {status}
### Operations
- {status}

## Recent Decisions
- DEC-{NNN}: {title} ({date}) — {one-line summary of choice}
(Omit this section if no decisions since last sync)

## Pending Decision Reviews
- DEC-{NNN}: {title} — review by {review_date} ({confidence}, {reversibility})
(Omit this section if no pending reviews)

## Blockers
- {blocker}: {recommended resolution}

## Cross-Department
- {conflicts or dependencies to resolve}

## Recommended Focus
1. {highest priority action}
2. {second priority}
3. {third priority}

## Context Updates Needed
- {any context files that should be updated}
```

### 6. Update State

After presenting the sync:
- Update `.cofounder/context/state.md` with current status
- Save full sync output to `.cofounder/sync/latest.md`
- Feed memory with any learnings from the sync

### 7. Ask the Founder

"Based on this sync, here's what I'd recommend focusing on: {top recommendation}. What do you want to tackle?"

---

## Depth Levels

**Quick sync** — when the founder just wants a pulse check:
- Read state.md and recent git history
- 3-bullet summary: what shipped, what's active, what's blocked
- Update state.md

**Standard sync** — the default:
- Full department check-in as described above
- Cross-department analysis
- Recommendations

**Deep sync** — when things feel off or it's been a while:
- Spawn department agents for detailed assessment
- Review all context files for staleness
- Check memory for patterns
- Comprehensive report with strategic recommendations
