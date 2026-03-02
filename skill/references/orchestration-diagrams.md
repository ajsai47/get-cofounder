# Orchestration Diagrams

How every command routes work through departments.

## Master Flow

```
  Founder -> /command -> Load Context -> Route to Departments -> [Agents] -> Synthesize -> Output + Memory
```

## Per-Command Flows

### /sync — Parallel Department Check-ins

```
  /sync
    |
    v
  Read: state.md, product.md
    |
    +--------+--------+--------+
    v        v        v        v
  Product  Eng      Mktg     Ops
  (sprint- (devops- (growth- (analytics-
  prior.)  autom.)  hacker)  reporter)
    |        |        |        |
    +--------+--------+--------+
    v
  Synthesize -> sync/latest.md + state.md (updated)
```
Parallel: All 4. Sequential: Synthesis after all report.

### /brief — Update Context

```
  /brief {change} -> Read all context -> Identify affected -> Update files + Notify agents
```
Sequential: Identify first. Then updates and notifications in parallel.

### /research — Parallel Evidence Gathering

```
  /research {feature}
    |
  Read: product.md, market.md, state.md
    |
  Define hypothesis
    |
    +--------+-----------+
    v        v           v
  Product  Product     AI Adapter
  (trend-  (feedback-  (tech-
  research) synth.)    advisor)
    |        |           |
    +--------+-----------+
    v
  Score 4 dimensions + Competitive scan
    |
  Verdict: GO / NO-GO / NEEDS DATA
    |
  research/{slug}.md + market.md (if updated)
```
Parallel: All 3 research agents. Sequential: Scoring after evidence.

### /plan — Sequential Planning Pipeline

```
  /plan {slug}
    |
  Read: research/{slug}.md, product.md, state.md, brand.md
    |
  1. Requirements (sprint-prioritizer)
    |
  2. Architecture (backend-architect + tech-advisor) <-- parallel within step
    |
  3. Interface (ui-designer) <-- skip if no UI
    |
  4. Test Strategy (test-engineer)
    |
  5. Scope + Estimate (sprint-prioritizer + project-shipper)
    |
  6. Validation Gate (checklist)
    |
  plans/{slug}.md + state.md (updated)
```
Parallel: Steps 2 agents run together. Sequential: Each step depends on the prior.

### /launch — Pre-Flight Then Deploy

```
  /launch {feature}
    |
  Read: product.md, state.md, brand.md
    |
    +--------+--------+--------+
    v        v        v        v
  Eng      Design   Mktg     Ops
  (devops  (brand-  (content (support
  + test)  guard.)  + social) + analytics)
    |        |        |        |
    +--------+--------+--------+
    v
  Readiness: GO / HOLD / NO-GO
    v (if GO)
  Launch Sequence: T-60 ... T+24hr
    v
  Post-Launch Monitor -> state.md + product.md (updated)
```
Parallel: All 4 audits. Sequential: Report -> Sequence -> Post-launch.

### /compete — Parallel Intelligence

```
  /compete {competitor}
    |
  Read: market.md, product.md, state.md
    |
    +--------+-----------+
    v        v           v
  Product  Marketing   Marketing
  (trend-  (growth-    (social-
  research) hacker)    strategist)
    |        |           |
    +--------+-----------+
    v
  Threat Assessment -> Opportunities + Recommendations
    |
  market.md + memory/competitive.md (updated)
```
Parallel: All 3 intel agents. Sequential: Assessment after intel.

### /metrics — Parallel Data Collection

```
  /metrics
    |
  Read: state.md, product.md
    |
    +--------+-----------+
    v        v           v
  Ops      Ops         Ops
  (analytics-(infra-   (finance-
  reporter)  maint.)   tracker)
    |        |           |
    +--------+-----------+
    v
  Health Assessment -> Recommendations -> state.md (updated)
```
Parallel: All 3 data collectors. Sequential: Assessment after collection.

### /retro — Gather, Reflect, Commit

```
  /retro
    |
  Read: state.md, sync/latest.md, memory/retros.md
    |
    +--------+-----------+
    v        v           v
  Product  Eng         Ops
  (sprint- (devops-    (analytics-
  prior.)  autom.)     reporter)
    |        |           |
    +--------+-----------+
    v
  Insights (5 questions) -> Score (0-100) -> 3 Actions (max)
    |
  memory/retros.md + memory/estimation.md + state.md
```
Parallel: All 3 data gatherers. Sequential: Insights -> Score -> Actions.

### /pitch — Read Everything, Build Narrative

```
  /pitch {audience}
    |
  Read: ALL context + memory files
    |
  Narrative Arc (content-creator) -- sequential first
    |
    +--------+-----------+
    v        v           v
  content-  brand-     social-       -- parallel after narrative
  creator   guardian   strategist
    |        |           |
    +--------+-----------+
    v
  Pitch materials delivered
```

### /hire — Assess, Define, Publish

```
  /hire {role}
    |
  Read: state.md, product.md
    |
  1. Assess Need (sprint-prioritizer)
  2. Role Definition (relevant dept head)
  3. Job Description (content-creator + brand-guardian) <-- parallel
  4. Interview Process (sprint-prioritizer)
    |
  Role spec + job description delivered
```

---

## Agent Dependency Map

```
  trend-researcher ---+---> sprint-prioritizer ---> backend-architect
  feedback-synth. ----+                                    |
  tech-advisor ------------------------------------> (also feeds)
                                                           v
                                                    frontend-developer
                                                           v
                                                    test-engineer
                                                           v
                                                    devops-automator
                                                           |
       +----------------------+------------------------+---+
       v                      v                        v
  content-creator       social-strategist       analytics-reporter
       v                      v                        |
  brand-guardian         growth-hacker                 |
                              +----------+-------------+
                                         v
                                   context-keeper (feeds memory for next cycle)
```

---

## Parallel vs. Sequential Guide

| Command | Parallel Agents | Sequential After | Total |
|:--------|:----------------|:-----------------|:------|
| /sync | sprint-prior., devops-auto., growth-hacker, analytics-rep. | Synthesis | 4 |
| /brief | Context updates + notifications | Identify affected files | 1-2 |
| /research | trend-researcher, feedback-synth., tech-advisor | Score + verdict | 3 |
| /plan | backend-architect + tech-advisor (within step 2) | Req -> Arch -> Design -> Test -> Validate | 5 |
| /launch | 4 dept audits (eng, design, mktg, ops) | Report -> Sequence -> Post-launch | 6 |
| /compete | trend-researcher, growth-hacker, social-strat. | Assessment -> Recommendations | 3 |
| /metrics | analytics-rep., infra-maint., finance-tracker | Assessment -> Recommendations | 3 |
| /retro | sprint-prior., devops-auto., analytics-rep. | Insights -> Score -> Actions | 3 |
| /pitch | content-creator, brand-guardian, social-strat. | Narrative arc first | 3 |
| /hire | content-creator + brand-guardian (step 3) | Assess -> Define -> Describe -> Process | 3 |

**Rule of thumb:** Evidence gathering is parallel. Synthesis and decisions are sequential.
