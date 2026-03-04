# Coordination Map

How departments and agents work together. Handoffs, workflows, conflict resolution.

---

## Cross-Department Handoff Matrix

| From | To | What Passes | Trigger |
|:-----|:---|:------------|:--------|
| **Product** (sprint-prioritizer) | **Engineering** | Requirements, acceptance criteria | Feature prioritized for sprint |
| **Product** (trend-researcher) | **Marketing** (content-creator) | Competitor analysis, positioning angles | New market signal |
| **Product** (feedback-synthesizer) | **Product** (sprint-prioritizer) | Synthesized feedback, pattern report | Feedback batch threshold |
| **Design** (ui-designer) | **Engineering** (frontend-developer) | Component specs, design tokens | Design spec approved |
| **Design** (ux-researcher) | **Design** (ui-designer) | User flow analysis, recommendations | UX research complete |
| **Design** (brand-guardian) | Any agent producing output | Brand corrections, style violations | Output ready for review |
| **Engineering** | **Testing** (test-engineer) | Completed code, changed files | Implementation complete |
| **Engineering** | **Testing** (performance-engineer) | New endpoints, infrastructure changes | Performance-sensitive code shipped |
| **Testing** (test-engineer) | **Engineering** | Test failures, repro steps, coverage gaps | Tests fail or coverage drops |
| **Testing** (tool-evaluator) | **Engineering** | Evaluation report, migration path | Tool evaluation complete |
| **AI Adapter** (tech-advisor) | **Engineering** | Stack recommendation, migration plan | Architecture decision point |
| **AI Adapter** (tool-scout) | **Testing** (tool-evaluator) | Discovered tools, initial assessment | New tool identified |
| **Marketing** (growth-hacker) | **Engineering** (frontend-developer) | A/B test specs, experiment design | Growth experiment designed |
| **Marketing** (content + social) | **Design** (brand-guardian) | Draft content for review | Content ready for publication |
| **Operations** (analytics-reporter) | **Product** + **Marketing** | Usage data, funnel metrics, trends | Analytics cycle or anomaly |
| **Operations** (support-responder) | **Product** (feedback-synthesizer) | Ticket patterns, feature requests | Support pattern identified |
| **Operations** (infra-maintainer) | **Engineering** (devops-automator) | Alerts, scaling needs, cost analysis | Threshold crossed |
| **Project Mgmt** (project-shipper) | All departments | Timeline, dependency updates | Sprint boundary or blocker |
| **Project Mgmt** (experiment-tracker) | **Product** (sprint-prioritizer) | Experiment results, significance | Experiment concludes |
| **Marketing** (growth-hacker) | **Sales** (outbound-strategist) | Qualified inbound leads, engagement signals | Lead scores above threshold or requests demo |
| **Sales** (outbound-strategist) | **Sales** (deal-closer) | Qualified prospects, conversation context | Prospect responds positively, meeting booked |
| **Sales** (deal-closer) | **Product** (sprint-prioritizer) | Feature requests from deals, competitive gaps | Deal blocked by missing feature |
| **Sales** (deal-closer) | **Marketing** (content-creator) | Case study material, testimonials | Deal closed won |
| **Sales** (partnership-manager) | **Engineering** (backend-architect) | Integration requirements, API specs | Partnership approved |
| **Sales** (deal-closer) | **Memory** (context-keeper) | Win/loss analysis, pricing learnings | Deal closed (won or lost) |
| **Product** (trend-researcher) | **Sales** (partnership-manager) | Partnership opportunities from market research | Ecosystem opportunity identified |
| **Memory** (context-keeper) | All departments (via context files) | Updated lessons, patterns | Significant work completes |

---

## Common Multi-Department Workflows

### 1. Ship a Feature

**Product** (requirements) --> **Design** (specs + flows) --> **Engineering** (build) --> **Testing** (validate) --> **Marketing** (announce) --> **Operations** (track + monitor)

Parallel: Marketing drafts while Engineering builds. Design and Engineering are sequential.

### 2. Handle a Bug Report

**Operations/Support** (triage, repro steps) --> **Engineering** (diagnose, fix) --> **Testing** (validate, add regression test) --> **Operations/Support** (close loop with user)

Memory captures: root cause and prevention pattern.

### 3. Launch a Marketing Campaign

**Marketing/Growth** (strategy, channels) --> **Marketing/Content + Social** (create content, parallel) --> **Design/Brand Guardian** (review) --> **Product** (confirm readiness) --> **Operations/Analytics** (set up tracking)

### 4. Evaluate a New Tool

**AI Adapter/Scout** (discover, assess) --> **Testing/Evaluator** (deep eval) --> **Engineering** (proof of concept) --> **AI Adapter/Advisor** (final recommendation)

Memory captures: decision and rationale for future reference.

### 5. Respond to a Competitor Move

**Product/Researcher** (analyze move) --> **Marketing/Content + Social** (positioning content, parallel) --> **Product/Prioritizer** (adjust roadmap if needed)

Updates: market.md. Memory captures: competitor pattern.

### 6. Process User Feedback

**Operations/Support** (collect, categorize) --> **Product/Feedback** (synthesize patterns) --> **Product/Prioritizer** (integrate into priorities)

Updates: state.md if priorities shift. Memory captures: feedback patterns.

### 7. Run an Experiment

**Product/Prioritizer** (hypothesis, success criteria) --> **Project Mgmt/Experiment** (tracking setup) --> **Engineering** (implement flag/test) --> **Operations/Analytics** (monitor data) --> **Project Mgmt/Experiment** (call result)

Memory captures: what worked, what didn't, why.

### 8. Close a Deal

**Sales/Outbound** (prospect, personalize) --> **Sales/Closer** (qualify, propose, negotiate) --> **Marketing/Content** (case study if won) --> **Memory** (win/loss capture)

Parallel: Outbound can prospect while Closer works existing pipeline. Memory capture after every close.

Updates: `.cofounder/memory/sales.md`. Product gets feature request data if deals are blocked.

### 9. Build a Partnership

**Sales/Partnership** (identify, evaluate) --> **Engineering** (build integration if approved) --> **Marketing/Content** (co-branded content) --> **Sales/Partnership** (activate, measure)

Parallel: Content creation while Engineering builds integration. Sequential: Evaluation before engineering investment.

Updates: `product.md` (new integrations), `.cofounder/memory/sales.md` (partnership learnings).

### 10. Onboard to a New Codebase

**Automatic (on setup):** Cofounder scans the codebase during first-run setup — file structure, tech stack, testing patterns, CI/CD, linting. Results written to `.cofounder/memory/engineering.md`. This gives immediate engineering context without manual effort.

**Deep scan (manual):** For deeper analysis beyond the automatic scan:

**Engineering** (map architecture, patterns, dependencies) --> **Testing** (assess coverage, run tests) --> **Operations/Infra** (map deployment, hosting, costs)

Memory captures: full codebase and infrastructure context for future sessions.

---

## Conflict Resolution

Departments will disagree. That's by design -- different perspectives surface better decisions.

### Engineering "too complex" vs. Product "must have"

1. Engineering quantifies: how long, maintenance burden, what breaks
2. Product quantifies: who needs it, evidence, cost of not doing it
3. Apply three lenses (value, feasibility, leverage)
4. Look for the 80% version -- almost always exists

**Default:** Ship the simpler version. Complexity compounds.

### Marketing wants features vs. Engineering wants tech debt

1. Is the debt blocking users or causing errors? Debt wins.
2. Is the marketing feature time-sensitive? It may take priority.
3. Can they run in parallel? Often yes.
4. Check `state.md` -- align to current priorities.

**Default:** User-facing pain beats theoretical debt. Revenue-generating work beats theoretical debt.

### Design "more polish" vs. Project Mgmt "ship now"

1. Apply the bar: "Would I ship this to 100 users and not be embarrassed?"
2. If yes -- ship. Polish next iteration.
3. If no -- take the time. First impressions matter.
4. Core flows get polish. Edge cases ship rough.

**Default:** Ship. Exception: onboarding and first-run experience.

### General Protocol

1. **Quantify both sides.** Data over gut feelings.
2. **Check context files.** The answer is often in `state.md` or `product.md`.
3. **Apply the lenses.** Value, feasibility, leverage.
4. **Surface to Founder.** "A says X because [reasons]. B says Y because [reasons]. I recommend Z because [rationale]."
5. **Capture the decision.** Memory records it so next time resolves faster.

---

## Information Flow

```
                        ┌─────────────┐
                        │   FOUNDER   │
                        └──────┬──────┘
                               │
                        ┌──────▼──────┐
                        │  COFOUNDER  │
                        └──────┬──────┘
                               │
            ┌──────────────────┼──────────────────┐
            ▼                  ▼                  ▼
     ┌────────────┐    ┌────────────┐    ┌────────────┐
     │  CONTEXT   │◄──►│   MEMORY   │    │    SYNC    │
     │  brand.md  │    │  index.md  │    │ latest.md  │
     │  voice.md  │    │ {domain}.md│    └─────┬──────┘
     │ product.md │    └─────┬──────┘          │
     │  market.md │          │                 │
     │  state.md  │          │                 │
     └─────┬──────┘          │                 │
           └─────────────────┼─────────────────┘
                             ▼
     ┌──────────────────────────────────────────┐
     │              DEPARTMENTS                  │
     │                                           │
     │  Engineering ◄──► Product ◄──► Marketing  │
     │       ▲               ▲            ▲      │
     │       ▼               ▼            ▼      │
     │  Testing ◄───► Design ◄───► Project Mgmt  │
     │       ▲               ▲            ▲      │
     │       ▼               ▼            ▼      │
     │  AI Adapter     Operations  Sales ◄► Memory│
     └──────────────────────────────────────────┘
```

### Context File Ownership

| File | Consumers | Updaters |
|:-----|:----------|:---------|
| `brand.md` | All agents | Brand Guardian, Founder |
| `voice.md` | Content Creator, Social Strategist, Support | Content Creator, Founder |
| `product.md` | Engineering, Product, Design, Marketing | Sprint Prioritizer, Founder |
| `market.md` | Trend Researcher, Growth Hacker, Content Creator | Trend Researcher, Founder |
| `state.md` | All agents | Cofounder via /sync, Founder via /brief |
| `memory/` | All agents (index at start, domain on-demand) | Context Keeper |

### Feedback Loops

**Build-Measure-Learn:** Engineering builds --> Operations measures --> Product learns --> Engineering builds better

**Content-Growth:** Marketing creates --> Operations tracks --> Growth Hacker optimizes --> Marketing creates better

**Sales Pipeline:** Outbound prospects --> Closer qualifies --> Closer closes --> Memory captures win/loss --> Outbound refines targeting

**Partnership Loop:** Partnership Manager identifies --> Engineering integrates --> Marketing co-promotes --> Partnership Manager measures --> Memory captures learnings

**User Feedback:** Operations collects --> Product synthesizes --> Prioritizer prioritizes --> Engineering ships

**Memory (meta):** Any department works --> Context Keeper captures --> Next session reads --> Output improves

Every loop tightens over time. The shared brain gets richer, the agents get smarter, and the Founder ships faster.
