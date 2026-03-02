---
description: "Research gate — validate assumptions and gather evidence before committing to build"
argument-hint: "[feature-or-question]"
allowed-tools: ["Read", "Glob", "Grep", "WebSearch", "WebFetch", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/product.md`, `.cofounder/context/market.md`, and `.cofounder/context/state.md` before proceeding.

# /research — Research Gate

Validate before you build. This command gathers evidence, checks assumptions, and produces a GO / NO-GO / NEEDS MORE DATA verdict. Run it before committing to anything that takes more than a day to build.

---

## When to Run

- **Before building a new feature** — is there real demand? Can we actually build it? Does it fit our priorities?
- **Before a major pivot** — are we reading the market right?
- **When the founder has a hunch** — "I think users want X" is a hypothesis, not a fact. Test it.
- **Before adopting a new technology** — is it mature enough? Will it lock us in?
- **When competitors ship something** — do we need to respond, or is it noise?

If the answer to "should we build this?" feels obvious, you probably still need /research. Obvious assumptions are the ones that burn you.

---

## Depth Levels

**Quick** (~30 min) — gut-check a specific question:
- Web search for existing solutions and market signals
- Check product.md and market.md for strategic fit
- Skim user feedback for demand signals
- Produce a lightweight verdict with 2-3 key findings

**Standard** (~2 hours) — the default:
- Multi-agent evidence gathering (market, user, technical)
- Competitive scan with differentiation analysis
- Technical feasibility assessment
- Full verdict with scored dimensions

**Deep** (~half day) — high-stakes decisions:
- Comprehensive market research across multiple sources
- User interview synthesis and feedback deep dive
- Technical prototype or proof-of-concept evaluation
- Competitive landscape mapping
- Full report with recommendations and contingencies

Choose the depth that matches the stakes. A $500 feature gets a quick check. A $50,000 bet gets a deep dive.

---

## Process

### 1. Define the Question

Before gathering evidence, be precise about what we're trying to learn.

Frame it as:
- **Hypothesis**: "We believe {X} because {Y}."
- **Key question**: "Is there evidence that {Z}?"
- **Decision**: "If the answer is yes, we will {action}. If no, we will {alternative}."

A vague question gets vague answers. "Should we build a dashboard?" is weak. "Do our users need self-serve analytics, and would a dashboard reduce support volume by 30%+?" is testable.

### 2. Gather Evidence

Spawn agents in parallel to collect evidence across three dimensions:

**Market Intelligence (spawn: trend-researcher)**
- What does the market landscape look like for this capability?
- Are there emerging trends that support or undermine this idea?
- What signals from industry blogs, conferences, and thought leaders?
- Is the timing right — too early, too late, or just right?
- Check Product Hunt, Hacker News, industry newsletters for recent activity

**User Evidence (spawn: feedback-synthesizer)**
- Is there real demand? Look for:
  - Direct user requests (support tickets, feedback forms, social mentions)
  - Indirect signals (workarounds users are building, feature misuse patterns)
  - Market-level demand (competitor traction, search volume, community discussions)
- How many users would this affect? Power users or everyone?
- What's the cost of NOT building this? (churn risk, competitive disadvantage)

**Technical Feasibility (spawn: tech-advisor)**
- Can we build this with our current stack?
- What are the dependencies — new libraries, APIs, infrastructure?
- Estimated complexity: trivial, moderate, significant, or massive?
- Are there existing solutions we can integrate instead of building from scratch?
- What's the maintenance burden after v1 ships?
- Any security, privacy, or compliance considerations?

### 3. Competitive Scan

Quick competitive check focused on this specific capability:

- Has anyone else built this? List competitors with this feature.
- How did they implement it? What's the user reception?
- If competitors have it: what's our differentiation angle?
- If competitors don't have it: why not? (Opportunity or warning sign?)
- Are there open-source alternatives that do 80% of what we need?

Read `.cofounder/context/market.md` for existing competitor data. Don't duplicate work already captured there.

### 4. Synthesize Evidence

Combine all findings into a structured assessment. Score each dimension:

**Evidence Score (1-5):** Quantity and quality of supporting evidence
- 1: No evidence found. Pure speculation.
- 2: Anecdotal. A few mentions, nothing systematic.
- 3: Moderate. Multiple independent signals pointing the same direction.
- 4: Strong. Clear evidence from multiple sources with consistent patterns.
- 5: Overwhelming. Data-backed, validated, undeniable demand.

**Demand Score (1-5):** User and market demand signals
- 1: No demand signals. Nobody is asking for this.
- 2: Weak. A few users mentioned it once.
- 3: Moderate. Regular requests, some workarounds in use.
- 4: Strong. Frequent requests, users leaving because we lack it.
- 5: Urgent. Blocking deals, causing churn, competitive table stakes.

**Feasibility Score (1-5):** Technical and resource feasibility
- 1: Near-impossible with current resources. Would require fundamental rearchitecture.
- 2: Very hard. Months of work, new expertise needed, high risk.
- 3: Doable. Weeks of work, some new dependencies, manageable risk.
- 4: Straightforward. Days of work, familiar territory, low risk.
- 5: Trivial. Hours of work, well-understood problem, minimal risk.

**Strategic Fit Score (1-5):** Alignment with current priorities and direction
- 1: Contradicts our strategy. Would pull us off course.
- 2: Tangential. Doesn't hurt but doesn't help our main goals.
- 3: Somewhat aligned. Supports our direction but isn't core.
- 4: Well-aligned. Directly supports current priorities and roadmap.
- 5: Perfect fit. This IS the strategy — exactly what we should be building.

### 5. Render Verdict

Calculate the average score across all four dimensions:

| Average Score | Verdict | Meaning |
|:-------------|:--------|:--------|
| 3.5 or higher | **GO** | Evidence supports building this. Proceed to planning. |
| 2.5 — 3.4 | **NEEDS MORE DATA** | Promising but uncertain. Identify what's missing and gather more evidence. |
| Below 2.5 | **NO-GO** | Evidence doesn't support this. Kill it or revisit later. |

A NO-GO is not a failure — it's a save. Every NO-GO protects days or weeks of wasted effort.

### 6. Document

Save research output to `.cofounder/research/{slug}.md`.

If this is a GO, the research file becomes the foundation for `/plan`. Keep it factual, concise, and referenceable.

Update `.cofounder/context/state.md` if the research shifts priorities.
Update `.cofounder/context/market.md` if competitive insights emerged.

---

## Output Format

```markdown
# Research: {feature or question}

## Verdict: {GO | NO-GO | NEEDS MORE DATA}
Score: {X.X}/5.0

## Evidence Summary
| Dimension | Score | Key Finding |
|-----------|-------|-------------|
| Evidence | X/5 | {what we found} |
| Demand | X/5 | {user signals} |
| Feasibility | X/5 | {technical assessment} |
| Strategic Fit | X/5 | {priority alignment} |

## Key Findings
- {finding 1}
- {finding 2}
- {finding 3}

## Competitive Landscape
- {competitor 1}: {what they do, how it's received}
- {competitor 2}: {what they do, how it's received}
- {our angle}: {differentiation or gap}

## Risks and Unknowns
- {risk 1}: {likelihood, impact}
- {unknown 1}: {what we still don't know}

## Recommendation
{what to do next — build, test, defer, or kill}

## If GO: Next Step
-> Run `/plan {slug}` to create implementation plan

## If NEEDS MORE DATA: What's Missing
- {specific question to answer}
- {evidence to gather}
- {experiment to run}
```

---

## Decision Trees

**"Should I run /research or just build it?"**
```
Is the work > 1 day of effort?
|-- No -> Just build it. Ship and learn.
|-- Yes -> Is the outcome obvious and well-understood?
    |-- Yes -> Still do a quick (30 min) research check.
    |-- No -> Run /research standard before committing.
```

**"Quick, standard, or deep?"**
```
What's at stake?
|-- Small feature (<1 week) -> Quick
|-- Medium feature (1-4 weeks) -> Standard
|-- Major bet (>1 month or strategic shift) -> Deep
```

---

## Anti-Patterns

- **Research as procrastination.** Research is a gate, not a destination. If you've been researching for longer than you'd spend building v1, you're stalling.
- **Ignoring a NO-GO.** The whole point is to save you from bad bets. If the evidence says no, listen. Your gut is not smarter than data.
- **Confirmation bias.** Don't research to prove you're right. Research to find out if you're wrong. Seek disconfirming evidence.
- **Researching things that don't matter.** A color change doesn't need a research phase. Reserve this for decisions that are expensive to reverse.
- **Perfect information.** You'll never have 100% certainty. A 3.5 average is enough to proceed. Don't wait for a 5.0.
- **Skipping the question definition.** Vague research produces vague results. Spend 5 minutes framing the question sharply — it saves hours of unfocused investigation.

---

## Principles

- **Evidence over intuition.** Hunches are starting points, not conclusions. Research turns hunches into data.
- **Speed-appropriate rigor.** Match research depth to decision stakes. Don't spend 4 hours researching a 2-hour feature.
- **Kill early, kill cheap.** A NO-GO after 30 minutes of research is infinitely better than a pivot after 3 months of building.
- **Research feeds planning.** A GO verdict isn't the end — it's the input to `/plan`. The research document becomes the plan's foundation.
- **Compound learning.** Every research cycle makes the next one faster. Patterns emerge. Market intuition sharpens. The shared brain gets smarter.
