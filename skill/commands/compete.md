---
description: "Competitive analysis — assess threats, identify opportunities, update market positioning"
argument-hint: "[competitor-name]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "WebSearch", "WebFetch", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/market.md` and `.cofounder/context/state.md` before proceeding.

# /compete — Competitive Analysis

Structured competitive intelligence for a solofounder who can't afford to be blindsided but also can't afford to spend all day watching competitors. Synthesize what matters, ignore what doesn't, and turn insights into decisions.

---

## When to Run

- **Monthly** — 2-hour scan to stay current (the default)
- **Quarterly** — 4-hour deep analysis with strategic reassessment
- **Triggered** — competitor launches something significant, pricing changes, new entrant appears, or founder asks "what's happening in the market?"
- **Pre-launch** — before shipping a major feature, check if competitors already have it and how they positioned it

---

## Depth Levels

**Quick scan** (~30 min) — something specific triggered this:
- Check the specific competitor or event
- Assess immediate impact
- Decide: respond, monitor, or ignore
- Update market.md if needed

**Monthly monitor** (~2 hours) — the default:
- Review all tracked competitors for changes
- Fresh intelligence from web and social
- Update threat scores
- Identify new opportunities
- Update market.md

**Quarterly deep dive** (~4 hours) — strategic reassessment:
- Full competitive landscape review
- New entrant identification
- Positioning analysis with differentiation scoring
- Pricing comparison matrix
- Strategic recommendations for next quarter
- Update market.md and feed memory

---

## Process

### 1. Current Landscape Review

Read `.cofounder/context/market.md` for the existing competitive landscape.
Read `.cofounder/context/product.md` to understand our current positioning and features.
Read `.cofounder/context/state.md` for company phase and priorities.
Read `.cofounder/memory/competitive.md` (if exists) for past intelligence and patterns.

Build the current competitor roster:

| Competitor | Category | Last Updated | Threat Score | Status |
|-----------|----------|-------------|-------------|--------|
| {name} | Direct | {date} | {score} | {active/declining/new} |

Flag any competitor data older than 30 days as stale — it needs refreshing.

### 2. Fresh Intelligence Gathering

Route to agents for real-time intelligence:

**Product (spawn: trend-researcher)**
- What have competitors shipped in the last 30 days?
- Any new entrants in our space?
- Industry trends that affect competitive dynamics
- Conference talks, blog posts, product announcements
- Check Product Hunt, Hacker News, relevant subreddits for launches

**Marketing (spawn: growth-hacker)**
- Competitor pricing page changes (use web search or Wayback Machine)
- Competitor positioning shifts (homepage copy, tagline, messaging changes)
- New marketing channels competitors are investing in
- Content strategy changes (new blog themes, social presence shifts)
- App store ranking changes (if applicable, route to app-store-optimizer)

**Marketing (spawn: social-strategist)**
- Competitor social media activity and engagement trends
- Community sentiment about competitors (Reddit, Twitter, forums)
- Any public complaints or praise that reveals positioning gaps

Sources to check (prioritize free, fast sources):
- Competitor websites and changelogs
- Product Hunt and Hacker News launches
- Twitter/X mentions and competitor accounts
- Reddit discussions in relevant subreddits
- GitHub activity (if open source competitors)
- App store reviews (if applicable)
- Industry newsletters and blogs
- Crunchbase for funding announcements

### 3. Threat Assessment

Score each competitor using the **Competitor Threat Matrix**:

| Factor | Definition | Scale |
|--------|-----------|-------|
| **Overlap** | How much does their product overlap with ours? | 1 (minimal) — 5 (near-identical) |
| **Momentum** | Are they shipping fast, growing, gaining attention? | 1 (stagnant) — 5 (accelerating) |
| **Resources** | Funding, team size, distribution advantages? | 1 (bootstrapped solo) — 5 (well-funded, large team) |

**Threat Score** = Overlap x Momentum x Resources (max 125)

| Score | Classification | Action |
|-------|---------------|--------|
| 50-125 | **High threat** | Monitor weekly. Active strategic response needed. |
| 25-49 | **Medium threat** | Monitor monthly. Track for escalation. |
| 10-24 | **Low threat** | Track quarterly. Note but don't react. |
| <10 | **Noise** | Ignore unless something changes dramatically. |

**Differentiation Score** — for each high/medium threat competitor:

| Dimension | Us | Them | Advantage |
|-----------|-----|------|-----------|
| Price | {our pricing} | {their pricing} | {who wins} |
| UX/Design | {our approach} | {their approach} | {who wins} |
| Feature depth | {our coverage} | {their coverage} | {who wins} |
| Speed/Performance | {our speed} | {their speed} | {who wins} |
| Integration breadth | {our integrations} | {their integrations} | {who wins} |
| AI-native capability | {our AI features} | {their AI features} | {who wins} |
| Community/Brand | {our presence} | {their presence} | {who wins} |

Count advantage columns. If competitor leads 5+ of 7 dimensions, they're a serious threat. If we lead 5+, they're not worth worrying about. The 3-4 split is where strategic positioning matters most.

### 4. Opportunity Identification

With the landscape mapped, look for gaps:

**Underserved segments:**
- Who are competitors ignoring or serving poorly?
- Is there a user persona that falls between existing solutions?
- Are there adjacent use cases nobody is addressing?

**Feature gaps:**
- What are users complaining about on competitor platforms? (Check reviews, Reddit, Twitter)
- What features do competitors charge premium for that we could include at lower tiers?
- What integrations are missing from the competitive landscape?

**Positioning gaps:**
- Is everyone positioning the same way? (e.g., all "enterprise-first" — opening for a dev-first alternative)
- Is there an unoccupied narrative? (e.g., everyone sells on features, nobody sells on simplicity)
- Can we own a category that doesn't exist yet?

**Timing gaps:**
- Competitor just raised funding? They'll be slow for 3-6 months while they hire and restructure.
- Competitor just had a PR crisis? Users are shopping for alternatives right now.
- Competitor deprecated a feature? Those users need a new home.

### 5. Strategic Recommendations

For each significant competitive development, apply the **Response Decision Framework**:

**Competitor launches a feature we planned:**
```
Is it core to our differentiation?
├── Yes → Match within 30 days, but differentiate the implementation
├── No, but users expect it → Add to roadmap, ship within 60 days
└── No → Ignore. Don't let competitors set your roadmap.
```

**Competitor drops pricing:**
```
Are we losing deals on price?
├── Yes, confirmed by user feedback → Adjust pricing or add value at current price
├── No → Hold pricing. Competing on price as a solofounder is a losing game.
└── Unknown → Survey users. Don't react to competitor moves without data.
```

**New entrant appears:**
```
Threat score > 50?
├── Yes → Deep analysis immediately. What's their unfair advantage?
├── 25-49 → Add to monthly monitoring. Watch first 90 days.
└── <25 → Note and move on. Most new entrants don't survive.
```

**Competitor gets acquired:**
```
Acquired by a company in our space?
├── Yes → Expect feature consolidation. Their users may churn during integration.
├── No, acqui-hire → Product likely to sunset. Target their users.
└── No, strategic → Monitor for 90 days. New parent may invest or neglect.
```

Generate 3-5 strategic recommendations, each with:
- **Recommendation**: what to do
- **Rationale**: why, based on the competitive intelligence
- **Effort**: estimated time to implement
- **Impact**: expected competitive advantage gained
- **Urgency**: do this now / next sprint / next quarter / someday

### 6. Update Context

Route to **Memory (spawn: context-keeper)**:

Update `.cofounder/context/market.md` with:
- Revised competitor table with updated threat scores
- New entrants added
- Removed or downgraded competitors
- Updated differentiation positioning
- New trends identified

Save to `.cofounder/memory/competitive.md`:
- Date of analysis
- Key findings and threat score changes
- Strategic recommendations made
- Competitor moves timeline (chronological log)
- Opportunities identified

---

## Output Format

```markdown
# Competitive Analysis — {date}

## Landscape Summary
{2-3 sentence overview of the competitive environment right now}

## Competitor Scorecard

| Competitor | Overlap | Momentum | Resources | Threat Score | Change |
|-----------|---------|----------|-----------|-------------|--------|
| {name} | {1-5} | {1-5} | {1-5} | {score} | {up/down/stable} |

## Key Moves Since Last Analysis
- **{Competitor}**: {what they did} — Impact: {high/medium/low}
- **{Competitor}**: {what they did} — Impact: {high/medium/low}

## Threat Assessment
### High Threats (score 50+)
- **{Competitor}**: {why they're dangerous, what to watch}

### Medium Threats (score 25-49)
- **{Competitor}**: {status, trajectory}

### New Entrants
- **{Name}**: {what they do, initial threat assessment}

## Opportunities
1. **{Opportunity}**: {gap identified, how to exploit it}
2. **{Opportunity}**: {gap identified, how to exploit it}

## Strategic Recommendations
1. **{Action}** ({urgency}) — {rationale}. Effort: {time}. Impact: {expected result}.
2. **{Action}** ({urgency}) — {rationale}. Effort: {time}. Impact: {expected result}.
3. **{Action}** ({urgency}) — {rationale}. Effort: {time}. Impact: {expected result}.

## Context Updated
- market.md: {what changed}
- memory/competitive.md: {what was logged}
```

---

## Solofounder Competitive Intelligence Budget

You don't have a market research team. Allocate your competitive intelligence time deliberately:

- **2 hours/month**: Scan competitors for changes. Update threat scores. Check for new entrants.
- **4 hours/quarter**: Deep analysis. Revisit positioning. Strategic recommendations.
- **As-needed**: When something specific triggers it (launch, pricing change, acquisition).

Total: ~30 hours/year on competitive intelligence. That's it. More than that means you're watching instead of building.

---

## Anti-Patterns

- **Competitor-driven roadmap.** They ship a feature, you rush to match. Now they're setting your priorities. Build for your users, not against your competitors.
- **Analysis without action.** A beautiful competitive matrix that doesn't change any decision is a waste of 2 hours.
- **Monitoring everyone.** Track 3-5 competitors max. More than that and you're spreading attention too thin.
- **Ignoring indirect competitors.** The biggest threat is often not the company that does what you do — it's the company whose users could use your product but don't know it exists.
- **Reacting to funding announcements.** A competitor raising $50M doesn't change your next sprint. It changes their next 18 months. You have time.
- **Pricing panic.** A solofounder competing on price against a funded competitor is a death spiral. Compete on experience, speed, or focus instead.

---

## Principles

- **Awareness, not obsession.** Know the landscape. Don't stare at it all day.
- **Build for users, not against competitors.** User problems are your roadmap. Competitors are context.
- **Solofounder advantage is speed and focus.** You can ship in a week what takes them a quarter. Use that.
- **Differentiation beats feature parity.** You don't need to match every feature. You need to be clearly better at the thing your users care most about.
- **Intelligence decays fast.** Competitive data older than 90 days is unreliable. Refresh regularly or don't track at all.
