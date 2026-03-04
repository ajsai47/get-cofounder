---
description: "Planning gate — break down a validated feature into an implementation plan"
argument-hint: "[feature-slug]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Agent"]
model: opus
---

> **Auto-loaded context:** Read `.cofounder/context/product.md`, `.cofounder/context/state.md`, and `.cofounder/context/brand.md` before proceeding.

# /plan — Planning Gate

Turn a validated idea into a buildable plan. Run this AFTER `/research` gives a GO verdict, BEFORE writing any code. The plan breaks the work into phases, defines requirements, identifies risks, and sets a scope that a solofounder can actually ship.

---

## When to Run

- **After /research returns GO** — the default path. Research validates the idea, /plan structures the execution.
- **Before any work >2 days** — if you're about to spend a week building, spend 1-2 hours planning first.
- **When scope feels unclear** — "I know what to build but not where to start" is exactly when you need a plan.
- **Before delegating work** — if Devin or another agent will implement, the plan is their spec.

Do NOT run /plan for work that takes less than a day. Just build it. Planning small work costs more than building it wrong and fixing it.

---

## Process

### 1. Load Research

Read `.cofounder/research/{slug}.md` for the research verdict and evidence.

If no research file exists:
- Is this a simple, well-understood task? Skip research, proceed with a lightweight plan.
- Is this complex or uncertain? Stop. Run `/research {slug}` first. Planning without evidence is guessing with extra steps.

Extract from the research file:
- The validated hypothesis and key findings
- Demand signals and user evidence
- Technical feasibility assessment and constraints
- Competitive context and differentiation angle

### 2. Define Requirements

Route to **Product (spawn: sprint-prioritizer)**.

Translate the research findings into concrete requirements. Each requirement must have:

- **Number**: sequential, for easy reference
- **Description**: what the feature must do, stated as a user outcome
- **Priority**: Must (launch-blocking), Should (important but deferrable), Could (nice-to-have)
- **Acceptance criteria**: how we'll know it's done — specific, testable, unambiguous

Priority rules:
- **Must-have**: without this, the feature doesn't work. Maximum 3-5 musts per plan.
- **Should-have**: without this, the feature works but feels incomplete. 2-4 shoulds.
- **Could-have**: polish, edge cases, advanced options. Unlimited, but don't list more than you'd realistically build.

If you have more than 5 must-haves, the scope is too big. Split it into multiple plans.

### 3. Design Architecture

Route to **Engineering (spawn: backend-architect)** and **AI Adapter (spawn: tech-advisor)**.

Define the technical approach:

**Data model**: What data structures, schemas, or models are needed? What changes to existing models?

**API design**: New endpoints, modified endpoints, request/response shapes. Follow existing API patterns in the codebase.

**Component structure**: New components, modified components, shared utilities. Follow existing component patterns.

**Integration points**: What existing systems does this touch? What are the interface contracts?

**Technology decisions**: Any new dependencies? Libraries, APIs, services? For each one:
- Why this over alternatives?
- What's the lock-in risk?
- Is there an AI-native or MCP-first option?

Read the codebase first. Match existing patterns. A plan that introduces a new paradigm needs a very good reason.

### 4. Design the Interface

Route to **Design (spawn: ui-designer)** — skip this step if the feature has no user-facing component.

Define:
- **Key screens or views**: what the user sees, step by step
- **Component inventory**: new vs. reusable components
- **Interaction model**: how the user accomplishes their goal
- **States**: loading, empty, error, success, edge cases
- **Responsive considerations**: mobile, tablet, desktop behavior
- **Brand alignment**: must conform to brand.md guidelines

Keep it to flow descriptions and component lists, not pixel-perfect mockups. The solofounder is shipping, not designing.

### 5. Define Test Strategy

Route to **Testing (spawn: test-engineer)**.

Define what to test and how, covering:

- **Critical paths**: the flows that absolutely cannot break. Write tests for these first.
- **Integration points**: where this feature touches other systems. Test the boundaries.
- **Edge cases**: unusual inputs, empty states, permission boundaries. List them, prioritize them.
- **Performance**: will this feature affect load times, memory, or API response times? Define budgets.
- **Regression risks**: what existing features could this break? What to smoke-test after shipping.

Test strategy, not test plan. List what matters, not every possible test case. The engineer writing the tests will fill in the details.

### 6. Map Dependencies

Identify what must happen before, during, and after implementation:

- **Prerequisites**: API keys, accounts, migrations, design decisions needing founder input
- **Parallel workstreams**: Frontend + backend (after API contract defined), marketing + engineering, docs + testing
- **Blockers**: Ambiguous requirements, missing credentials, feature dependencies, unresolved technical questions

### 7. Scope and Estimate

This is where solofounder discipline matters most.

**Phase the work:**
- **Phase 1 (MVP)**: The minimum that delivers user value. Ship this first. Must-haves only.
- **Phase 2 (Complete)**: Should-haves added. The full version of the feature.
- **Phase 3 (Polish)**: Could-haves, optimizations, and refinements.

**Estimate each phase** in hours, not days. Hours force precision. Apply estimation multipliers from `.cofounder/memory/estimation.md` if it exists.

**The 2-hour planning budget**: If planning itself is taking longer than 2 hours, the feature is too big. Split it into smaller plans, each independently shippable.

**Scope cuts**: For every plan, explicitly list what you're NOT building. This is as important as what you are building. Scope creep starts with ambiguity about boundaries.

### 8. Capture Tech Decisions

Review the architecture and technology decisions made during this planning process. For each significant choice (new dependency, architecture pattern, vendor selection):

1. Read the project-scope `decisions/journal.json` (`.cofounder/decisions/journal.json`). Create the directory and file if they don't exist (initialize with `{"next_id": 1, "decisions": []}`).
2. For each tech decision, create a journal entry:
   - `source`: `"plan"`
   - `scope`: `"project"` (unless it's a cross-project tool preference → `"user"`)
   - `departments`: typically `["engineering"]`, add others if the decision affects them
   - `context`: reference the plan slug and requirement that drove the choice
   - `options`: include alternatives that were considered during architecture design
   - `tags`: include the plan slug for traceability
3. Append entries to journal, increment `next_id` for each
4. Regenerate `decisions/index.md`

Not every tech choice needs capturing — only decisions where alternatives were genuinely considered. "We used React because the project already uses React" is not a decision. "We chose tRPC over REST for the new API" is.

### 9. Validation Gate

Route to **constitutional-validator** (if one exists in the context system) or apply these checks manually:

- [ ] Does this plan align with the product's current priorities in state.md?
- [ ] Is the scope realistic for a solofounder to ship in the estimated time?
- [ ] Are the must-have requirements truly must-haves, or is scope creep hiding in the priorities?
- [ ] Does the architecture follow existing patterns, or does it introduce unnecessary complexity?
- [ ] Is there a clear definition of "done" for Phase 1?
- [ ] Can Phase 1 ship independently without Phase 2?
- [ ] Are the risks identified and mitigated, not just listed?

If any check fails, revise the plan before proceeding.

### 10. Document

Save the plan to `.cofounder/plans/{slug}.md`.

Update `.cofounder/context/state.md` with the planned work and estimated timeline.

The plan document becomes the implementation spec. Engineers (human or AI) should be able to build from it without further context.

---

## Output Format

```markdown
# Plan: {feature name}

## Overview
{1-paragraph summary: what, why, for whom}

## Research Foundation
Based on: `.cofounder/research/{slug}.md` — Verdict: GO ({X.X}/5.0)

## Requirements
| # | Requirement | Priority | Acceptance Criteria |
|---|-------------|----------|---------------------|
| 1 | {requirement} | Must | {testable criteria} |
| 2 | {requirement} | Should | {testable criteria} |

## Architecture
{Data model, API design, component structure, technology decisions}

## Implementation Phases
### Phase 1: MVP ({X hours})
- [ ] {task 1}
**Ships:** {what the user gets}

### Phase 2: Complete ({X hours})
- [ ] {task 1}

### Phase 3: Polish ({X hours})
- [ ] {task 1}

## Test Strategy
- **Critical paths**: {what must not break}
- **Edge cases**: {unusual scenarios}

## Scope Cuts
- NOT building: {excluded items}
- Deferred to v2: {tempting but out of scope}

## Risks
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {mitigation} |

## Decisions Captured
- DEC-{NNN}: {tech decision title} (source: plan)

## Estimated Total: {X hours}

## Validation
- [x] Aligns with priorities, scope is realistic, Phase 1 ships independently

## Next Step
-> Approved? Start building. Run `/launch {slug}` when ready.
```

---

## Decision Trees

**"Should I /plan or just build?"**
- Work < 2 days? Just build it.
- Work > 2 days, scope clear? Quick plan (1 hour).
- Work > 2 days, scope unclear? Full plan (2 hours). Research first if not done.

**"Plan is taking too long"**
- Under 2 hours? Keep going.
- Over 2 hours? Feature is too big. Split into smaller plans, cut scope, or ship Phase 1 only.

**"Do I need /research first?"**
- Research file says GO? Proceed.
- Research file says NO-GO? Don't plan.
- Research file says NEEDS MORE DATA? Gather data, re-run /research.
- No research file + low-risk idea? Proceed, note research skipped.
- No research file + uncertain idea? Run `/research` first.

---

## Anti-Patterns

- **Plans that are longer than the code they describe.** If the plan is 500 lines for a 200-line feature, you're over-engineering the planning.
- **Planning without research.** A detailed plan built on unvalidated assumptions is a detailed way to waste time.
- **Must-have inflation.** If everything is a must-have, nothing is. Three to five must-haves, maximum. Be ruthless.
- **Architecture astronautics.** Don't design for 10x scale when you have 10 users. Build for now, design for the ability to change later.
- **Phase 2 dependency.** If Phase 1 is useless without Phase 2, they're not separate phases — they're one phase. Phase 1 must ship independently.
- **Planning as avoidance.** Planning feels productive. Building is productive. Know the difference. The plan is a means, not an end.
- **Ignoring existing patterns.** Read the codebase before proposing architecture. The best plan extends what exists, not replaces it.

---

## Principles

- **Plans are living documents.** Update the plan as you build. Reality always diverges from the plan — capture the divergence.
- **Phase 1 is the product.** Everything after Phase 1 is a bet that the feature is worth more investment. Ship Phase 1 and measure before committing to Phase 2.
- **Specificity is kindness.** Vague requirements produce rework. Specific acceptance criteria produce shipped features.
- **Scope is the only lever.** As a solofounder, you can't add people or time. You can only cut scope. Get good at it.
- **The plan serves the builder.** Whether the builder is you, an AI agent, or a contractor, the plan should answer their questions before they ask them.
