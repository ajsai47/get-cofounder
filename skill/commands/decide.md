---
description: "Decision journal — capture, structure, and track decisions with full context"
argument-hint: "[decision-title or topic]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/state.md`, `.cofounder/context/product.md`, and the foundations decision framework (`references/foundations.md`) before proceeding.

# /decide — Decision Journal

Capture decisions with full context so future sessions never ask "why did we do it this way?" Structured, append-only, queryable.

---

## When to Run

- **After choosing between real alternatives** — "We went with Neon over Supabase"
- **Before a hard-to-reverse choice** — architecture, vendor, pricing model
- **When the founder states a decision** — "let's go with X" → capture it
- **When facilitating a decision** — founder is weighing options, help them think through it
- **Proactively during /plan or /research** — tech decisions and GO verdicts auto-capture (see Auto-Capture below)

Don't capture trivial choices. If nobody would ever wonder "why?", it doesn't need a journal entry.

---

## Data Model

Each decision entry follows this schema:

```json
{
  "id": "DEC-042",
  "title": "Choose Neon over Supabase for database",
  "date": "2026-03-03",
  "status": "active",
  "superseded_by": null,
  "scope": "project",
  "departments": ["engineering", "operations"],
  "reversibility": "moderate",
  "confidence": "high",
  "source": "manual",
  "context": "Needed a serverless Postgres provider. Key requirements: branching, connection pooling, edge compatibility.",
  "options": [
    {
      "name": "Neon",
      "pros": ["Serverless-native", "Database branching", "Free tier generous"],
      "cons": ["Newer, less battle-tested", "No built-in auth"]
    },
    {
      "name": "Supabase",
      "pros": ["Auth + DB bundle", "Large community", "Real-time built in"],
      "cons": ["Not truly serverless", "Heavier than needed", "Lock-in to their auth"]
    }
  ],
  "decision": "Chose Neon — serverless-native architecture matches our edge-first stack. Auth handled separately via Clerk.",
  "consequences": "Must manage auth separately. Branching enables safe migrations. No real-time out of the box.",
  "review_date": null,
  "outcome": null,
  "outcome_date": null,
  "tags": ["database", "infrastructure"]
}
```

**Field reference:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | string | Yes | Auto-assigned `DEC-NNN` from journal's `next_id` |
| `title` | string | Yes | Short, descriptive title |
| `date` | string | Yes | ISO date when decision was made |
| `status` | enum | Yes | `active` / `superseded` / `revisit` / `reversed` |
| `superseded_by` | string | No | ID of the decision that replaced this one |
| `scope` | enum | Yes | `project` / `user` / `local` |
| `departments` | array | Yes | Which departments this affects |
| `reversibility` | enum | Yes | `easy` / `moderate` / `hard` |
| `confidence` | enum | Yes | `high` / `medium` / `low` |
| `source` | enum | Yes | `manual` / `sync` / `retro` / `plan` / `research` / `session` |
| `context` | string | Yes | What prompted the decision |
| `options` | array | No | Alternatives considered with pros/cons |
| `decision` | string | Yes | What was chosen and why |
| `consequences` | string | Yes | Trade-offs accepted |
| `review_date` | string | No | ISO date to revisit this decision |
| `outcome` | string | No | What actually happened (filled during /retro) |
| `outcome_date` | string | No | When outcome was recorded |
| `tags` | array | No | Free-form tags for search |

---

## Storage

Dual format — JSON source of truth + auto-generated markdown index:

```
{scope-dir}/decisions/
├── journal.json    ← structured, queryable, source of truth
└── index.md        ← auto-generated, human-scannable
```

**Scope directories:**
- Project: `.cofounder/decisions/`
- User: `~/.claude/cofounder-memory/decisions/`
- Local: `.cofounder/memory-local/decisions/`

**journal.json structure:**

```json
{
  "next_id": 1,
  "decisions": []
}
```

Created on first use. If the directory or file doesn't exist, create it.

---

## Process

### 1. Read Context

Read `.cofounder/context/state.md` and `.cofounder/context/product.md` for current priorities.
Read `references/foundations.md` for the decision framework (three lenses).

### 2. Capture or Facilitate

**If the founder stated a decision** (e.g., "let's go with Neon"):
- Extract the decision from what they said
- Ask clarifying questions to fill gaps: "What were the other options? What tipped it?"
- Don't over-interrogate — capture what's known, leave unknown fields null

**If the founder is weighing options** (e.g., "should we use X or Y?"):
- Use the foundations decision framework:
  1. **Frame** — what exactly are we deciding?
  2. **Three lenses** — Value (does it matter?), Feasibility (can we do it?), Leverage (what gives the most?)
  3. **Recommend** — have an opinion, state it clearly
  4. **Trade-offs** — what do we gain, what do we give up?
  5. **Founder decides** — they make the call

**If invoked with a topic** (e.g., `/decide database provider`):
- Check if there's already a decision on this topic in the journal
- If yes: show the existing decision, ask if they want to update or supersede it
- If no: facilitate a new decision using the framework above

### 3. Collect Fields

From the conversation, collect:
- **title** — short, descriptive (e.g., "Choose Neon over Supabase for database")
- **context** — what situation prompted this decision
- **options** — alternatives with pros/cons (at minimum the chosen option)
- **decision** — what was chosen and why (one sentence is fine)
- **consequences** — trade-offs accepted
- **reversibility** — easy (can change in hours), moderate (days/weeks), hard (months or requires migration)
- **confidence** — high (strong evidence), medium (reasonable but uncertain), low (best guess)
- **departments** — which departments this affects
- **tags** — free-form tags for future search

### 4. Classify Scope

Use the context-keeper's scope selection framework:
- "Would this be useful in a different project?" → **User scope**
- "Is this specific to this codebase/product?" → **Project scope**
- "Is this personal/sensitive/temporary?" → **Local scope**
- "Not sure?" → **Project scope**

### 5. Assign ID and Store

1. Read the appropriate scope's `journal.json` (create if doesn't exist)
2. Assign the next `DEC-NNN` from `next_id`, increment `next_id`
3. Build the full decision object
4. Append to the `decisions` array
5. Write updated `journal.json`

### 6. Regenerate Index

Regenerate `index.md` from `journal.json`. Format:

```markdown
# Decision Journal

> Auto-generated from journal.json. Do not edit directly.

## Active Decisions

| ID | Date | Title | Departments | Reversibility | Confidence |
|----|------|-------|-------------|---------------|------------|
| DEC-001 | 2026-03-03 | Choose Neon over Supabase | engineering, ops | moderate | high |

## Superseded / Reversed

| ID | Date | Title | Status | Superseded By |
|----|------|-------|--------|---------------|
| DEC-000 | 2026-02-15 | Use SQLite for MVP | superseded | DEC-001 |

## Pending Review

| ID | Title | Review Date | Status |
|----|-------|-------------|--------|
| DEC-005 | Trial Clerk for auth | 2026-04-01 | revisit |
```

### 7. Cross-Reference

Add a one-line reference in the relevant domain memory file:
- `[DEC-042] Chose Neon over Supabase for database — see decisions/journal.json`

This connects the memory system to the decision journal without duplicating content.

### 8. Confirm

Present the captured decision to the founder:

```
Captured: DEC-042 — Choose Neon over Supabase for database
Scope: project | Departments: engineering, operations
Reversibility: moderate | Confidence: high

Trade-offs: Must manage auth separately. No real-time out of box.

Set a review date? (e.g., "revisit in 30 days")
```

---

## Querying: "Why did we choose X?"

Not a separate command — natural cofounder behavior. When the founder asks a "why" question about a past decision:

1. **Search project-scope** `journal.json` — match against `title`, `decision`, `tags`, `context`
2. **Fall back to user-scope** journal if no project match
3. **Fall back to legacy domain files** in `.cofounder/memory/` for pre-journal decisions
4. **Present the full decision record** — context, options, choice, consequences

If the decision was found:
```
Found it — DEC-042 (2026-03-03):

We chose Neon over Supabase because serverless-native architecture matched our
edge-first stack. Auth handled separately via Clerk.

Options considered: Neon (chosen), Supabase
Trade-offs accepted: Must manage auth separately, no real-time out of box.
Reversibility: moderate | Confidence: high | Status: active
```

If no decision was found:
```
No decision record for that. Want me to capture one now? I can reconstruct
from what's in memory and the codebase.
```

---

## Superseding a Decision

When a new decision replaces an old one:

1. Set the old decision's `status` to `superseded`
2. Set the old decision's `superseded_by` to the new decision's ID
3. Create the new decision with full context, referencing the old one
4. Regenerate index
5. Update the cross-reference in the domain memory file

---

## Auto-Capture Integration

Other commands auto-capture decisions with `source` set to the command name:

- **`/plan`** — Tech decisions made during architecture design (source: `"plan"`)
- **`/research`** — GO verdicts with rationale (source: `"research"`)
- **`/retro`** — Decision outcomes and status updates (source: `"retro"`)
- **`/sync`** — Surfaces recent decisions and pending reviews (read-only, no auto-capture)

Auto-captured decisions use the same schema but may have fewer fields filled in (e.g., no `options` array for a quick `/plan` tech choice). The founder can always run `/decide` to enrich them later.

---

## Review Dates

When a decision has low confidence or is explicitly temporary:
- Suggest a review date (30, 60, or 90 days out depending on reversibility)
- `/sync` surfaces decisions approaching their review date
- `/retro` reviews decisions made during the sprint period

---

## Output Format

```markdown
## Decision Captured

**DEC-{NNN}**: {title}
**Date**: {date} | **Scope**: {scope} | **Source**: {source}
**Departments**: {departments}
**Reversibility**: {reversibility} | **Confidence**: {confidence}

### Context
{context}

### Options Considered
1. **{option}** — Pros: {pros} | Cons: {cons}

### Decision
{decision}

### Consequences
{consequences}

### Review
{review_date or "No review date set"}

---
Stored in: {scope-dir}/decisions/journal.json
Index updated: {scope-dir}/decisions/index.md
Cross-referenced: .cofounder/memory/{domain}.md
```

---

## Anti-Patterns

- **Capturing trivial decisions.** "We chose blue for the button" doesn't need a journal entry. Save it for choices where the "why" matters.
- **Missing the "why."** A decision without rationale is just a fact. The `decision` field must explain why, not just what.
- **No options considered.** If there were no alternatives, it wasn't a decision — it was an action. Decisions have options.
- **Forgetting to supersede.** When a decision changes, don't just make a new entry — link it to the old one. Otherwise the journal has contradictions.
- **Review date hoarding.** Don't set review dates on everything. Only on decisions with low confidence, temporary choices, or explicit "let's revisit" agreements.

---

## Principles

- **Append-only journal.** Never edit past entries (except to add `outcome` or change `status`). The journal is a log, not a wiki.
- **JSON is truth, markdown is view.** Always write to `journal.json` first, then regenerate `index.md`. Never edit the index directly.
- **Scope follows the decision.** Cross-project preferences go to user scope. Project-specific choices go to project scope. Use the same classification as the memory system.
- **The founder decides.** You facilitate, recommend, and capture — but the founder makes the call. This is their decision journal, not yours.
- **Future-you will thank present-you.** The value of this journal compounds. Session 50 can answer "why?" instantly instead of re-debating from scratch.
