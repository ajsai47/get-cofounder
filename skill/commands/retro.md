---
description: "Sprint retrospective — reflect on what shipped, extract learnings, score sprint health"
argument-hint: "[quick|standard|quarterly]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/state.md` and `.cofounder/sync/latest.md` before proceeding.

# /retro — Sprint Retrospective

Structured reflection on a completed sprint or period of work. Not a feel-good exercise — a diagnostic tool for finding what's broken in the process and fixing it before the next sprint.

---

## When to Run

- **End of every sprint** (weekly or biweekly, depending on cadence)
- **After a major launch** — what went well, what nearly broke
- **When velocity feels off** — shipping slower than expected, blockers piling up
- **Quarterly** — deeper review of patterns across multiple sprints

Run it before planning the next sprint. The retro feeds directly into prioritization.

---

## Depth Levels

**Quick retro** (~10 min) — end-of-week pulse check:
- Read state.md and recent git/task history
- 3 bullets: shipped, missed, one thing to change
- Update state.md with retro note

**Standard retro** (~30 min) — the default:
- Full data gathering, pattern analysis, action items
- Cross-department review
- Memory update with learnings

**Quarterly review** (~1 hour) — zoom out:
- Aggregate patterns across 4-6 sprints
- Velocity trend analysis over time
- Strategic process changes, not just tactical fixes
- Review whether past retro actions actually stuck
- Update memory with quarterly insights

---

## Process

### 1. Gather Data

Read `.cofounder/context/state.md` to understand what was planned.
Read `.cofounder/sync/latest.md` for recent standup context.
Read `.cofounder/memory/` files for past retro learnings and patterns.
Check git history, task trackers, and any sprint plan artifacts.

Build two lists:

**Planned vs. Shipped**

| Item | Planned | Shipped | Delta | Notes |
|------|---------|---------|-------|-------|
| {feature/task} | Yes | Yes | On time | — |
| {feature/task} | Yes | Partial | +2 days | Blocked by X |
| {feature/task} | Yes | No | Deferred | Deprioritized mid-sprint |
| {feature/task} | No | Yes | Unplanned | Urgent fix came up |

**Time Estimates vs. Actuals**

| Task | Estimated | Actual | Ratio | Category |
|------|-----------|--------|-------|----------|
| {task} | 4h | 6h | 1.5x | Underestimate |
| {task} | 2h | 1h | 0.5x | Overestimate |
| {task} | 8h | 16h | 2.0x | Major miss |

Calculate:
- **Completion rate**: items shipped / items planned (target: 70-85%)
- **Estimation accuracy**: average actual/estimated ratio (target: 0.8-1.2x)
- **Scope change**: unplanned items added / total items worked on
- **Carry-over rate**: items deferred to next sprint / items planned

### 2. Generate Insights

Route to relevant departments for assessment:

**Product (spawn: sprint-prioritizer)**
- Were the right things prioritized?
- Did mid-sprint scope changes derail the plan?
- Did we ship what users actually needed?

**Engineering (spawn: devops-automator)**
- Were there technical blockers that could have been avoided?
- Did any tasks take 2x+ longer than estimated? Why?
- Was there tech debt that slowed things down?

**Operations (spawn: analytics-reporter)**
- What do the metrics say about what we shipped?
- Did shipped features move the numbers we expected?
- Are there operational improvements that would increase velocity?

Analyze patterns by looking at memory for recurring themes:
- **Same blocker appearing twice?** It's a system problem, not a one-off.
- **Consistently underestimating a type of work?** Adjust the estimation multiplier.
- **Scope creep every sprint?** The planning process needs a scope lock.
- **Always deferring the same category?** Either commit to it or drop it from the roadmap.

### 3. Run the Reflection

Structure the reflection around five questions:

**What went well?**
- What shipped on time or ahead of schedule?
- What process worked better than before?
- What decision turned out to be right?
- What should we keep doing exactly as-is?

**What didn't go well?**
- What missed its target? Why?
- What took longer than expected? Root cause, not symptoms.
- What caused frustration or wasted effort?
- What would we do differently if we could redo this sprint?

**What surprised us?**
- Unplanned work that came up — was it truly urgent or just loud?
- Assumptions that turned out wrong
- Things that were easier or harder than expected

**What patterns are emerging?**
- Cross-reference with past retros in memory
- Are we getting better or worse at estimation?
- Are the same categories of work always the ones that slip?
- Is there a recurring blocker that needs a structural fix?

**What one thing would make the biggest difference next sprint?**
- Not three things. One. The highest-leverage process change.

### 4. Score Sprint Health

Calculate the **Sprint Health Score** (0-100):

| Metric | Weight | Scoring | Score |
|--------|--------|---------|-------|
| Completion rate | 25% | 85%+ = 25, 70-84% = 20, 50-69% = 10, <50% = 5 | {n} |
| Estimation accuracy | 20% | 0.8-1.2x avg = 20, 0.6-0.8 or 1.2-1.5x = 15, >1.5x or <0.6x = 5 | {n} |
| Scope stability | 15% | <15% unplanned = 15, 15-30% = 10, >30% = 5 | {n} |
| Blocker resolution | 15% | All resolved <24h = 15, all resolved in sprint = 10, carry-over = 5 | {n} |
| Carry-over rate | 10% | <15% = 10, 15-30% = 7, >30% = 3 | {n} |
| Learning captured | 10% | Actions from last retro implemented = 10, partially = 5, not at all = 0 | {n} |
| Founder energy | 5% | Self-reported: high = 5, medium = 3, low = 1 | {n} |
| **Total** | **100%** | | **{n}/100** |

Interpretation:
- **80-100**: Strong sprint. Keep doing what you're doing.
- **60-79**: Solid but with friction. One or two process fixes will help.
- **40-59**: Struggling. Identify the top blocker and fix it structurally before next sprint.
- **<40**: Something is fundamentally off. Step back and reassess priorities, scope, or approach.

### 5. Commit to Actions

Turn insights into specific, actionable commitments. Not "improve estimation" — instead "add 50% buffer to any task involving third-party API integration."

Each action must have:
- **What**: specific change to make
- **Why**: which pattern or problem it addresses
- **How**: concrete implementation (not just "try harder")
- **Verification**: how we'll know if it worked next retro

Limit to **3 actions maximum**. More than that and none of them stick.

### 6. Feed Memory

Route to **Memory (spawn: context-keeper)**:

Save to `.cofounder/memory/retros.md`:
- Sprint date range
- Health score
- Key patterns identified
- Actions committed to
- Whether past actions were implemented (accountability tracking)

Save to `.cofounder/memory/estimation.md` (if estimation patterns emerged):
- Types of work that consistently take longer
- Multipliers to apply (e.g., "third-party integrations: 1.5x estimate")

### 7. Update State

Update `.cofounder/context/state.md` with:
- Sprint health score
- What was completed
- What was deferred and why
- Active action items from retro
- Any priority shifts for next sprint

---

## Output Format

```markdown
# Retro — {date range}

## Sprint Health: {score}/100

## What Shipped
- {item}: {status, any notes}

## What Didn't Ship
- {item}: {why, where it goes now}

## Velocity
- Completion rate: {X}%
- Estimation accuracy: {X}x average
- Scope change: {X}% unplanned work
- Carry-over: {X} items to next sprint

## Patterns
- {pattern 1}: {evidence, frequency}
- {pattern 2}: {evidence, frequency}

## Reflection
### Went Well
- {insight}

### Didn't Go Well
- {insight with root cause}

### Surprising
- {unexpected finding}

## Actions for Next Sprint
1. **{Action}**: {specific change} — addresses {pattern}
2. **{Action}**: {specific change} — addresses {pattern}
3. **{Action}**: {specific change} — addresses {pattern}

## Accountability Check
- Last retro action 1: {implemented / partially / not done}
- Last retro action 2: {implemented / partially / not done}

## Memory Updated
- retros.md: {what was added}
- estimation.md: {what was added, if applicable}
- state.md: {what was updated}
```

---

## Anti-Patterns

- **Retro without data.** "I feel like it went okay" is not a retro. Pull the numbers first.
- **Vague action items.** "Be better at estimation" changes nothing. "Add 50% buffer to API integration tasks" does.
- **More than 3 actions.** Overcommitting to improvements guarantees none of them happen.
- **Skipping accountability.** If you don't check whether last sprint's actions were implemented, the retro is theater.
- **Blame without root cause.** "X took too long" isn't useful. "X took too long because we didn't account for the auth layer" is.
- **Retro only when things go wrong.** Good sprints have patterns worth reinforcing too. Run it every time.

---

## Principles

- **Retrospectives are diagnostic, not therapeutic.** The goal is to find process bugs and fix them.
- **Patterns matter more than incidents.** A one-off delay is noise. The same delay three sprints in a row is a signal.
- **Fewer, better actions.** One implemented improvement beats five forgotten ones.
- **Accountability is non-negotiable.** Every retro starts by checking whether last retro's actions happened.
- **Energy is a metric.** A burned-out founder shipping at 100% completion rate is not a healthy sprint. Sustainability counts.
