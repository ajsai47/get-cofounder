---
description: "KPI review — collect metrics, assess health, generate action recommendations"
argument-hint: "[quick|full|quarterly]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/state.md` and `.cofounder/context/product.md` before proceeding.

# /metrics — KPI Review

Structured metrics review that pulls together numbers from across the company, scores their health, and turns data into decisions. Not a dashboard you glance at — a diagnostic session where the numbers tell you what to do next.

---

## When to Run

- **Weekly** — quick pulse on the 5 numbers that matter most
- **Biweekly/Sprint end** — full metrics review tied to sprint retro (the default)
- **Monthly** — trend analysis across 4 data points, deeper pattern recognition
- **Quarterly** — strategic review with stage reassessment and North Star evaluation

Run it before sprint planning. Metrics should drive priorities, not follow them.

---

## Depth Levels

**Weekly pulse** (~10 min) — the numbers check:
- Read state.md for current metrics
- Check the 5 North Star metrics against targets
- Traffic light each one (green/yellow/red)
- Flag anything red for immediate attention

**Sprint review** (~30 min) — the default:
- Full metric collection across departments
- Trend comparison vs. last period and targets
- Health scoring for all tracked metrics
- Insight generation and action recommendations
- State update

**Monthly analysis** (~1 hour) — trend hunting:
- 4-week trend analysis for all metrics
- Leading vs. lagging indicator assessment
- Cohort analysis where applicable
- Metric-driven sprint priority recommendations
- Memory update with metric patterns

**Quarterly strategic** (~2 hours) — zoom out:
- 12-week trend analysis
- Stage assessment (are we still pre-launch? did we cross into growth?)
- North Star metric re-evaluation
- Metric stack reassessment (are we tracking the right things?)
- Tool and instrumentation review

---

## Process

### 1. Metric Collection

Read `.cofounder/context/state.md` for current metrics and targets.
Read `.cofounder/context/product.md` for product-specific metrics and definitions.
Read `.cofounder/memory/metrics.md` (if exists) for historical data and patterns.

Route to agents for fresh data:

**Operations (spawn: analytics-reporter)**
- Pull latest numbers from analytics tools (PostHog, Plausible, Vercel Analytics)
- Product metrics: active users, activation rate, retention, feature adoption
- Website metrics: traffic, conversion rate, bounce rate, time on page

**Operations (spawn: finance-tracker)**
- Revenue metrics: MRR, ARR, new revenue, churned revenue, expansion revenue
- Financial metrics: burn rate, runway, CAC, LTV
- Pull from Stripe dashboard, bank accounts, financial tools

**Marketing (spawn: growth-hacker)**
- Acquisition metrics: signups, trial starts, channel performance
- Conversion metrics: visitor-to-signup, signup-to-active, trial-to-paid
- Engagement metrics: email open rates, social engagement, content performance

**Product (spawn: feedback-synthesizer)**
- User satisfaction: NPS score, support ticket volume, feature requests
- Qualitative signals: what are users saying? any sentiment shifts?

Compile into a single metrics table:

| Metric | Current | Target | Last Period | Trend | Status |
|--------|---------|--------|-------------|-------|--------|
| {metric} | {value} | {target} | {last value} | {up/down/flat} | {green/yellow/red} |

### 2. Metrics by Company Stage

Not all metrics matter at every stage. Focus on what's relevant now.

**Pre-launch:**
| Metric | What to Track | Green | Yellow | Red | Free Tool |
|--------|--------------|-------|--------|-----|-----------|
| Waitlist size | Total signups | Growing 10%+ week/week | Growing <10% | Flat or declining | Notion form, Tally |
| Landing page conversion | Visitor → signup | >5% | 2-5% | <2% | Plausible + form analytics |
| Content engagement | Social/blog traction | Growing reach | Flat | Declining or no content | Twitter Analytics, Plausible |
| Design-market fit | Landing page clarity | <5s to understand value prop | Needs scroll to understand | Users confused | User testing (5-second test) |
| Build velocity | Features shipped/week | On roadmap pace | Slightly behind | Significantly behind | GitHub, Linear |

**Post-launch (0-100 users):**
| Metric | What to Track | Green | Yellow | Red | Free Tool |
|--------|--------------|-------|--------|-----|-----------|
| Activation rate | Signup → core action | >40% | 20-40% | <20% | PostHog |
| Day-1 retention | Return within 24h | >30% | 15-30% | <15% | PostHog |
| Week-1 retention | Return within 7 days | >20% | 10-20% | <10% | PostHog |
| NPS | User satisfaction | >50 | 20-50 | <20 | Typeform, manual |
| Support tickets | Bugs and confusion | Decreasing | Stable | Increasing | Email, Discord |

**Growth (100-1,000 users):**
| Metric | What to Track | Green | Yellow | Red | Free Tool |
|--------|--------------|-------|--------|-----|-----------|
| MRR | Monthly recurring revenue | Growing 15%+ m/m | 5-15% m/m | <5% m/m or declining | Stripe Dashboard |
| Churn rate (monthly) | Users canceling | <3% | 3-5% | >5% | Stripe Dashboard |
| CAC | Cost to acquire a customer | <1/3 LTV | 1/3-1/2 LTV | >1/2 LTV | Manual calculation |
| LTV | Lifetime value per customer | >3x CAC | 2-3x CAC | <2x CAC | Stripe + spreadsheet |
| Activation rate | Signup → core action | >50% | 30-50% | <30% | PostHog |
| Net revenue retention | Expansion - contraction - churn | >100% | 90-100% | <90% | Stripe Dashboard |

**Scale (1,000+ users):**
| Metric | What to Track | Green | Yellow | Red | Free Tool |
|--------|--------------|-------|--------|-----|-----------|
| Burn multiple | Net burn / net new ARR | <1.5x | 1.5-2.5x | >2.5x | Manual calculation |
| Gross margin | Revenue - COGS | >70% | 50-70% | <50% | Manual calculation |
| Payback period | Months to recover CAC | <12 months | 12-18 months | >18 months | Manual calculation |
| Logo churn | Customer count churn | <2% monthly | 2-4% | >4% | Stripe Dashboard |
| Revenue per employee | ARR / team size | Above industry median | At median | Below median | Manual calculation |

### 3. Health Assessment

Apply the **Traffic Light System** to every tracked metric:

- **Green**: At or above target. On track. No action needed.
- **Yellow**: Within 10% of target. Watch closely. May need intervention next sprint.
- **Red**: More than 10% below target. Needs attention this sprint. Identify root cause.

For each red metric, dig one level deeper:

```
Metric is red
├── Is the target wrong? (Set too aggressively for current stage)
│   └── Yes → Adjust target, note in state.md
├── Is the data wrong? (Tracking issue, not a real decline)
│   └── Yes → Fix instrumentation, note in memory
├── Is it a temporary dip? (Seasonal, one-time event, data artifact)
│   └── Yes → Note and monitor. Don't overreact.
└── Is it a real problem?
    └── Yes → Root cause analysis. Add to sprint priorities.
```

### 4. Leading vs. Lagging Indicators

Separate metrics into leading (predictive) and lagging (outcomes):

| Leading (act on these) | Lagging (these are the result) |
|------------------------|-------------------------------|
| Website traffic | Revenue |
| Signup rate | MRR growth |
| Activation rate | Retention |
| Feature adoption | NPS |
| Content engagement | Brand awareness |
| Trial starts | Paid conversions |
| Support ticket volume | Churn rate |

**The insight**: If lagging indicators are red, look at the corresponding leading indicators for the root cause. Churn is high? Check activation rate 30-60 days ago. Revenue flat? Check signup rate and trial conversion from last month.

### 5. Insight Generation

Route to **Product (spawn: sprint-prioritizer)** and **Operations (spawn: analytics-reporter)**:

Analyze the data for:

**What's improving?**
- Which metrics moved in the right direction?
- What caused the improvement? Can we double down?
- Is the rate of improvement accelerating or slowing?

**What's declining?**
- Which metrics moved in the wrong direction?
- When did the decline start? What changed around that time?
- Is this a trend or a blip? (Need 3+ data points for a trend.)

**What's stagnant?**
- Which metrics haven't moved in 2+ periods?
- Is flat good (retention holding steady) or bad (growth not growing)?
- What would it take to move this metric?

**Correlations:**
- Did any metrics move together? (Feature launch → activation spike → retention improvement)
- Did any metrics move opposite? (Traffic up but conversion down = wrong audience)
- Are there lagging effects visible? (Marketing push 4 weeks ago → signup increase now)

### 6. North Star Metric Framework

Every stage needs one metric that matters most. The North Star.

**How to select your North Star:**

```
What stage are you in?
├── Pre-launch → Waitlist growth rate (are people interested?)
├── Post-launch → Activation rate (do they get it?)
├── Growth → Weekly active users or MRR (are we growing?)
└── Scale → Net revenue retention (are we compounding?)
```

**Validation criteria** for a good North Star:
1. It reflects real value delivery to users (not vanity)
2. It's a leading indicator of revenue (not revenue itself until growth stage)
3. It's something you can influence this sprint (not a macro trend)
4. It's simple enough to explain in one sentence
5. When it goes up, the business is healthier

Review the North Star quarterly. It should change as you change stages.

### 7. Action Recommendations

Turn metric insights into sprint priorities:

For each red metric:
- **What**: specific action to move the metric
- **Expected impact**: how much improvement, by when
- **Effort**: time estimate
- **Dependencies**: what else needs to happen

For each yellow metric:
- **What**: monitoring plan or low-effort intervention
- **Trigger**: at what point it becomes a sprint priority

For each green metric:
- **What**: can we double down? Or is this metric on autopilot?

Rank recommendations by: **impact on North Star x effort required**. High impact, low effort goes first.

### 8. Update State

Update `.cofounder/context/state.md` with:
- Latest metrics snapshot with traffic light status
- North Star metric and current value
- Metric-driven priorities for next sprint
- Any target adjustments

Save to `.cofounder/memory/metrics.md`:
- Date of review
- Full metrics snapshot (for historical trending)
- Key insights and patterns
- Actions recommended
- Stage assessment (if it changed)

---

## Solofounder Metrics Dashboard

You don't need 50 metrics. You need 5. Here's how to pick them:

**The 5-metric stack:**

1. **North Star**: The one metric that matters most at your stage (see framework above)
2. **Acquisition**: How are new users finding you? (signups, traffic source breakdown)
3. **Activation**: Are new users getting value? (% completing core action within first session)
4. **Revenue**: Is the business sustainable? (MRR for SaaS, or revenue proxy for pre-revenue)
5. **Satisfaction**: Do users like it? (NPS, retention rate, or qualitative proxy)

**Free tool stack for each:**

| Metric | Tool | Cost | Setup Time |
|--------|------|------|-----------|
| North Star | Depends on metric — usually PostHog | Free tier | 30 min |
| Acquisition | Plausible or Vercel Analytics | Free tier | 15 min |
| Activation | PostHog (custom event tracking) | Free tier (1M events/mo) | 1 hour |
| Revenue | Stripe Dashboard | Free with Stripe | Already set up |
| Satisfaction | Manual NPS survey (Tally or Typeform) | Free tier | 30 min |

Total setup: ~2 hours. Total ongoing cost: $0.

---

## Output Format

```markdown
# Metrics Review — {date}

## North Star: {metric name}
**Current**: {value} | **Target**: {target} | **Trend**: {direction} | **Status**: {green/yellow/red}

## Dashboard

| Metric | Current | Target | Last Period | Trend | Status |
|--------|---------|--------|-------------|-------|--------|
| {metric} | {value} | {target} | {last} | {up/down/flat} | {green/yellow/red} |

## Health Summary
- Green: {count} metrics on track
- Yellow: {count} metrics to watch
- Red: {count} metrics need action

## Red Metrics — Root Cause
### {Metric Name}
- **Current**: {value} vs. target {target} ({X}% below)
- **Root cause**: {analysis}
- **Recommended action**: {specific action}

## Insights
- {Insight 1}: {what the data tells us}
- {Insight 2}: {correlation or pattern found}
- {Insight 3}: {leading indicator signal}

## Recommended Sprint Priorities (metric-driven)
1. **{Action}** — moves {metric} by targeting {root cause}. Effort: {time}.
2. **{Action}** — moves {metric} by targeting {root cause}. Effort: {time}.
3. **{Action}** — moves {metric} by targeting {root cause}. Effort: {time}.

## Stage Assessment
**Current stage**: {pre-launch/post-launch/growth/scale}
**Stage indicators**: {why we're in this stage}
**Next stage trigger**: {what metric milestone moves us to the next stage}

## Context Updated
- state.md: {metrics snapshot updated}
- memory/metrics.md: {historical data logged}
```

---

## Anti-Patterns

- **Tracking too many metrics.** 50 metrics means you're monitoring nothing. Pick 5, know them cold.
- **Vanity metrics.** Total signups, page views, Twitter followers — these feel good but don't predict business health. Track metrics that correlate with revenue and retention.
- **Reacting to single data points.** One bad week isn't a trend. Wait for 3 consecutive periods before declaring a problem. Noise is not signal.
- **Changing targets to match performance.** If you're missing targets, fix the strategy, not the target. Adjusting targets down is only valid when the original target was set without data.
- **Metrics without actions.** A dashboard you look at but don't act on is decoration. Every red metric needs a response. Every review needs at least one action item.
- **Lagging-only metrics.** If you only track revenue and churn, you'll see problems 30-60 days after they start. Leading indicators (activation, engagement, signup rate) give you time to react.
- **Measuring what's easy instead of what matters.** Page views are easy to track. Activation rate requires instrumentation. The hard-to-track metric is usually the one that matters.

---

## Principles

- **Metrics serve decisions.** Every metric you track should be capable of changing what you do next. If it can't, stop tracking it.
- **Stage-appropriate focus.** Pre-launch metrics look nothing like growth metrics. Track what matters for where you are, not where you want to be.
- **Leading over lagging.** By the time a lagging indicator turns red, the problem started weeks ago. Invest in leading indicator instrumentation.
- **Trends over snapshots.** A single number is meaningless without context. Always compare to last period and target. Direction matters more than position.
- **The North Star keeps you honest.** When everything feels chaotic, look at the one number. Is it going up? Then you're probably fine. Is it going down? Then nothing else matters until you fix it.
