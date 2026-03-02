---
description: "Define roles, write job descriptions, plan hiring when ready to grow"
argument-hint: "[role-title]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "WebSearch", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read `.cofounder/context/state.md` and `.cofounder/context/product.md` before proceeding.

# /hire — Hiring & Team Building

Define roles, write job descriptions, plan the hiring process. For when the solofounder is ready to become a team.

---

## Trigger

User invokes `/hire` or discusses hiring, job descriptions, team building, first hires.

---

## Process

### 1. Assess the Need

Before writing any job description:
- **What's the bottleneck?** What work isn't getting done that would unlock growth?
- **Full-time or contract?** Contractors for specific projects, full-time for ongoing needs.
- **Human or AI?** Could this be handled by an AI agent, MCP server, or automation? Check with tech-advisor first.
- **What's the budget?** Salary range, equity, benefits capacity.

### 2. Role Definition

```markdown
# Role: {title}

## Why This Role
{one paragraph — what problem this hire solves and what it enables}

## Responsibilities
- {primary responsibility 1}
- {primary responsibility 2}
- {primary responsibility 3}
- {primary responsibility 4}
- {primary responsibility 5}

## Requirements (Must-Have)
- {skill/experience 1 — something they need on day 1}
- {skill/experience 2}
- {skill/experience 3}

## Nice-to-Have
- {bonus skill 1}
- {bonus skill 2}

## What Success Looks Like
### 30 Days
- {what they'll accomplish in the first month}

### 90 Days
- {what they'll accomplish in the first quarter}

### 6 Months
- {what impact they'll have}

## Compensation
- **Salary range**: ${min} - ${max}
- **Equity**: {range, if applicable}
- **Benefits**: {what you offer}
- **Location**: {remote/hybrid/onsite}
```

### 3. Job Description (Public Posting)

Spawn content-creator with brand context:

```markdown
# {Title} at {Company}

{One compelling paragraph about the company — from brand.md}

## The Role
{What this person will do — exciting, specific, honest}

## You'll Be Working On
- {exciting project/area 1}
- {exciting project/area 2}
- {exciting project/area 3}

## You Might Be a Fit If
- {characteristic, not credential}
- {characteristic}
- {characteristic}

## Our Stack
{from product.md — technical details for engineering roles}

## What We Offer
- {compensation range — be transparent}
- {equity/benefits}
- {unique perks — flexibility, learning budget, etc.}

## How to Apply
{clear instructions — what to submit, what to expect}
```

### 4. Interview Process

```markdown
## Interview Process: {role}

### Stage 1: Application Review (24-48 hours)
- Screen for: {criteria}
- Red flags: {what to watch for}
- Auto-reject: {dealbreakers}

### Stage 2: Intro Call (30 min)
- Goals: Culture fit, motivation, role alignment
- Questions:
  1. {question about motivation}
  2. {question about relevant experience}
  3. {question about working style}
- Evaluate: Communication, enthusiasm, alignment

### Stage 3: Technical/Skill Assessment (60-90 min)
- For engineering: {take-home or live coding — describe format}
- For other roles: {relevant assessment}
- Evaluate: {specific criteria}

### Stage 4: Founder Chat (45 min)
- Goals: Deep dive on values, vision alignment, working style
- Questions:
  1. {question about their approach to the work}
  2. {question about challenge they've overcome}
  3. {question about what they'd do in first 30 days}
- Evaluate: Would you want to work with this person every day?

### Decision
- Timeline: {when to decide}
- Criteria: {weighted factors}
```

---

## First Hires Playbook

### When to Make Your First Hire

**Hire when:**
- You're turning down revenue because you can't deliver
- A specific skill gap is blocking growth (not "I'm busy")
- You have 6+ months of runway after the hire
- You've validated the role with contractors or freelancers first

**Don't hire when:**
- You're lonely (hire for impact, not company)
- You think you "should" have a team (grow when you need to)
- An AI agent or automation could handle it (check first)

### Typical First Hire by Company Type

| Company Type | First Hire | Why |
|-------------|-----------|-----|
| B2B SaaS | Technical co-founder or senior engineer | Scale the product |
| Consumer app | Growth/marketing | Scale distribution |
| Developer tool | Developer advocate | Scale community |
| Service business | Operations/delivery | Scale capacity |

### Hiring Channels for Startups

1. **Your network** — Best source. Ask for referrals.
2. **Twitter/LinkedIn posts** — Share the role, founder story
3. **AngelList/Wellfound** — Startup-focused job board
4. **Relevant communities** — Where your ICP hangs out (Discord, Reddit, Slack)
5. **University partnerships** — For intern/junior roles
6. **Recruiters** — For senior/specialized roles (20-25% fee, worth it for critical hires)

---

## Principles

- **Hire for the bottleneck.** Not the role that sounds important — the one that's actually blocking growth.
- **Slow to hire, fast to fire.** Better to wait for the right person than rush a wrong hire.
- **Transparency wins.** Share salary ranges. Explain the stage. Be honest about challenges. Attracts better candidates.
- **Culture is real.** One bad culture fit as a 2-person team destroys everything. Weight this heavily.
- **Contractors first.** Test the role with a contractor before committing to full-time. Validates the need and can become your first hire.
