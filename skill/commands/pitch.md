---
description: "Generate pitch deck content, one-pagers, and investor materials"
argument-hint: "[investor|customer|partner|press]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "WebSearch", "Agent"]
model: opus
---

> **Auto-loaded context:** Read all `.cofounder/context/` files before proceeding.

# /pitch — Investor & Pitch Deck Content

Generate pitch materials. Not just slides — the narrative, the data, the story that makes people believe.

---

## Trigger

User invokes `/pitch` or asks about investor materials, pitch deck, fundraising content.

---

## Process

### 1. Gather Context

Read all context files — the pitch is the entire company distilled:
- `.cofounder/context/brand.md` — who we are
- `.cofounder/context/product.md` — what we're building
- `.cofounder/context/market.md` — where we compete
- `.cofounder/context/state.md` — where we are (metrics, traction)
- `.cofounder/context/voice.md` — how we tell the story

### 2. Pitch Narrative Structure

Every pitch follows this arc. Adapt depth based on audience.

```
1. HOOK — One sentence that makes them lean in
2. PROBLEM — The pain that exists today (make it visceral)
3. SOLUTION — What you built and why it's different
4. DEMO — Show, don't tell (product screenshots, flow, video)
5. TRACTION — Numbers that prove it's working
6. MARKET — How big is this opportunity
7. BUSINESS MODEL — How you make money
8. TEAM — Why you can pull this off (even solo — that's a feature)
9. ASK — What you need and what you'll do with it
10. VISION — Where this goes in 5 years
```

### 3. Generate Content

Spawn agents in parallel:

**Content Creator** — Draft the narrative for each section
**Analytics Reporter** — Pull and format traction metrics
**Trend Researcher** — Market size data and competitive positioning
**Brand Guardian** — Ensure everything is on-brand

### 4. Pitch Deck Output

```markdown
# {Company Name} — Pitch Deck Content

## Slide 1: Title
- Company name, tagline, one visual
- "{hook line}"

## Slide 2: Problem
**Headline**: {the pain in one sentence}
- {supporting point 1 — ideally with a stat}
- {supporting point 2}
- {supporting point 3}
Speaker notes: {what to say, not what to show}

## Slide 3: Solution
**Headline**: {what you do, simply}
- {key feature/benefit 1}
- {key feature/benefit 2}
- {key feature/benefit 3}
Speaker notes: {transition from problem to solution narrative}

## Slide 4: Product
{Screenshot or demo description}
Speaker notes: {walk through the core flow}

## Slide 5: Traction
| Metric | Value | Growth |
|--------|-------|--------|
| {key metric} | {value} | {MoM/trend} |
Speaker notes: {the story the numbers tell}

## Slide 6: Market
- **TAM**: ${amount}
- **SAM**: ${amount}
- **SOM**: ${amount}
- {market trend that's a tailwind}
Speaker notes: {why now}

## Slide 7: Business Model
- {how you charge}
- {unit economics if available}
- {path to profitability}
Speaker notes: {revenue narrative}

## Slide 8: Competition
| | Us | Competitor 1 | Competitor 2 |
|--|-----|-------------|-------------|
| {differentiator 1} | ✓ | ✗ | ~ |
| {differentiator 2} | ✓ | ~ | ✗ |
Speaker notes: {positioning narrative — why we win}

## Slide 9: Team
- {founder}: {why you're the person to build this}
- {key advantage as a solo founder — speed, AI-native, lean}
Speaker notes: {founder-market fit narrative}

## Slide 10: Ask
- **Raising**: ${amount}
- **Use of funds**: {breakdown}
- **Milestones**: {what this capital enables}
Speaker notes: {the conviction close}

## Slide 11: Vision
"{where this goes — the big picture}"
Speaker notes: {leave them thinking about the future}
```

### 5. Supporting Materials

Also generate:
- **One-pager** — single page summary for email forwards
- **Elevator pitch** — 30 seconds, memorizable
- **FAQ** — answers to the 10 most common investor questions
- **Data room checklist** — what to have ready for due diligence

---

## Pitch Types

**Investor pitch** — Full deck, focus on market size, traction, team
**Customer pitch** — Focus on problem/solution, demo, social proof
**Partner pitch** — Focus on mutual value, integration, audience overlap
**Press pitch** — Focus on story, novelty, impact, founder narrative

---

## Principles

- **Story over data.** Data supports the story. It doesn't replace it.
- **Show, don't tell.** Product screenshots > feature lists. Metrics > adjectives.
- **Less is more.** 10-12 slides. One idea per slide. The deck isn't the pitch — you are.
- **Tailor the ask.** Different investors care about different things. Customize for the audience.
- **The solo founder advantage.** Frame it: lean team = more runway, AI-native = faster iteration, sole decision maker = speed.
