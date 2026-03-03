# Context System

How the shared brain works. Every agent reads from it. The Cofounder maintains it.

---

## Architecture

```
# User scope — identity (portable across projects)
~/.claude/cofounder-memory/
├── founder.md         ← who the founder is (strengths, gaps, style)
├── cofounder.md       ← who the AI cofounder is (name, archetype, personality)
├── index.md           ← global lesson index
└── {domain}.md        ← cross-project learnings

# Project scope — company context + memory
.cofounder/
├── context/           ← the shared brain
│   ├── brand.md       ← who we are
│   ├── voice.md       ← how we sound
│   ├── product.md     ← what we're building
│   ├── market.md      ← where we compete
│   └── state.md       ← where we are right now
├── memory/            ← what we've learned
│   ├── index.md       ← compact lesson index
│   └── {domain}.md    ← domain-specific learnings
└── sync/              ← department coordination
    └── latest.md      ← last standup output
```

---

## Context Files

### founder.md — Who You Are

The founder's profile. Generated during the Cofounder Match assessment. **Lives at user scope** (`~/.claude/cofounder-memory/founder.md`) — follows you across projects.

**Contents:**
- Name
- Archetype (Builder, Designer, Strategist, Storyteller, Operator)
- Zone of genius (in their own words)
- Known gaps (what drains them)
- Working style (dive in, step back, or talk through)
- Partnership preference (challenge, complement, or amplify)
- Key insight (one sentence synthesis)

**Read by:** The Cofounder (shapes how to interact, what to lean into, when to push back).
**Updated by:** `/recalibrate` if the founder's self-assessment changes.

### cofounder.md — Who I Am

The AI cofounder's identity. Generated during the Cofounder Match assessment. This is not a settings file — it's a personality that shapes every interaction. **Lives at user scope** (`~/.claude/cofounder-memory/cofounder.md`) — follows you across projects.

**Contents:**
- Name (chosen by founder or generated)
- Archetype (The Operator, The Scaler, The Executor, The Architect, The Visionary)
- Personality (2-3 sentences, first person)
- Primary focus areas (3-4 departments)
- Communication style (directness, push-back level, autonomy)
- Signature behavior (a specific habit)
- What they never do (anti-patterns)

**Read by:** Every agent (via the Cofounder's briefing). The cofounder's name and personality color all interactions.
**Updated by:** `/recalibrate` if the founder wants to adjust the relationship.

### brand.md — Who We Are

The identity document. Everything visual, verbal, and positional flows from here.

**Contents:**
- Company name and tagline
- Mission (one sentence)
- Values (3-5, with what each means in practice)
- Brand personality (how the brand acts and feels)
- Visual identity (colors, typography, imagery guidelines)
- Positioning statement (for [audience], [product] is the [category] that [key benefit] unlike [alternatives])

**Read by:** Every agent. This is the universal reference.
**Updated by:** Brand Guardian, Founder via /brief.

### voice.md — How We Sound

The writing style guide. Every piece of content — tweets, docs, emails, UI copy — should sound like this.

**Contents:**
- Tone description (e.g., "direct, warm, slightly irreverent")
- Writing principles (e.g., "short sentences", "active voice", "no jargon")
- Platform-specific variations (Twitter: punchy; Blog: conversational depth; Docs: clear and scannable)
- Example passages (3-5 real examples of the founder's writing)
- Words we use / words we avoid
- Signature phrases or patterns

**Read by:** Content Creator, Social Strategist, Support Responder, any agent producing text.
**Updated by:** Content Creator (via social feed analysis), Founder via /brief.

### product.md — What We're Building

The product source of truth. What it is, who it's for, where it's going.

**Contents:**
- Product name and one-line description
- Problem statement (what pain we solve)
- Target user / ICP (who, what they care about, where they are)
- Core features (what exists today)
- Roadmap (what's planned, rough priority order)
- Technical stack (languages, frameworks, infrastructure)
- Key metrics (what we measure, current values)

**Read by:** Engineering, Product, Marketing, Design agents.
**Updated by:** Sprint Prioritizer, Founder via /brief.

### market.md — Where We Compete

The competitive landscape and positioning.

**Contents:**
- Market category / space
- Key competitors (name, positioning, strengths, weaknesses)
- Our differentiation (why us over them)
- ICP details (demographics, psychographics, behaviors)
- Distribution channels (where ICP hangs out, how they discover products)
- Market trends (what's changing, tailwinds, headwinds)

**Read by:** Trend Researcher, Growth Hacker, Content Creator, Social Strategist.
**Updated by:** Trend Researcher, Founder via /brief.

### state.md — Where We Are Right Now

The real-time status. Updated frequently.

**Contents:**
- Current phase (pre-launch, beta, growth, scaling)
- Top 3 priorities this week/sprint
- Key metrics snapshot (MRR, users, conversion, etc.)
- Active blockers or risks
- Recent wins (what shipped, what landed)
- Department status summary (from last /sync)

**Read by:** Every agent (for context on current priorities).
**Updated by:** Cofounder (automatically via /sync), Founder via /brief.

---

## Memory System

### How It Works

**Capture** — after significant work completes:
- What approach worked and why
- What failed and why
- Patterns that should be repeated
- Patterns that should be avoided
- Tools/libraries/services that were evaluated

**Storage** — `.cofounder/memory/`:
- `index.md` is the compact summary — one line per lesson, categorized by department
- Domain files hold full context — the what, why, and how
- New domain files created when lessons don't fit existing categories

**Retrieval** — context-relevant, token-efficient:
- Every session: read `index.md` (small, gives you the landscape)
- On-demand: load domain files only when current task matches
- Before decisions: check if memory has relevant learnings

### Index Format

```markdown
# Memory Index

## Engineering
- [E-001] One-line lesson with enough context to be useful
- [E-002] Another lesson

## Product
- [P-001] User feedback pattern or product learning

## Marketing
- [M-001] What converts, what content works

## Design
- [D-001] Design decision or pattern

## Operations
- [O-001] Operational learning

## Meta
- [X-001] Cross-cutting lessons that span departments
```

### Rules
- One line per lesson in the index. Details in domain files.
- Don't duplicate. Check before adding. Update existing entries.
- Remove stale lessons when they no longer apply.
- Categorize by department, not by date.
- The memory system is for patterns, not for task tracking.

---

## Sync System

### /sync — Daily Standup

When `/sync` runs:

1. Each department reviews its active workstreams
2. Reports: what's done, what's in progress, what's blocked
3. Surfaces cross-department conflicts or dependencies
4. Updates `state.md` with current status
5. Updates `.cofounder/sync/latest.md` with full standup output

The Cofounder synthesizes all department reports and presents:
- **Highlights** — what shipped or progressed
- **Blockers** — what's stuck and what to do about it
- **Conflicts** — where departments disagree or have competing needs
- **Recommendations** — what to focus on next

### Sync Output Format

```markdown
# Sync — {date}

## Highlights
- {what shipped or progressed}

## In Progress
- {active workstreams by department}

## Blockers
- {what's stuck, recommended resolution}

## Conflicts
- {cross-department tensions, recommendation}

## Recommended Focus
- {what to prioritize next, and why}
```

---

## Context Updates

### /brief — Update Company Context

When context changes, use /brief to update the relevant files:

1. Founder describes the change
2. Cofounder identifies which context files are affected
3. Updates files with new information
4. Notifies which agents are affected
5. Summarizes what changed

### When to Update
- After a pivot or strategic shift → brand.md, product.md, market.md
- After voice refinement → voice.md
- After shipping a major feature → product.md, state.md
- After market research → market.md
- After every /sync → state.md
- When something feels "off" in agent output → check which context file is stale

---

## Setup Flow

First time initialization:

1. Create `.cofounder/` directory structure
2. Add `.cofounder/` to `.gitignore`
3. **Cofounder Match** — assess the founder (strengths, gaps, working style, partnership preference), generate complementary cofounder identity. Write identity files to user scope (`~/.claude/cofounder-memory/founder.md` and `cofounder.md`).
4. Walk the founder through each company context file:
   - Product: "What are you building? For whom? What's the stack?"
   - Brand: "What's your company? What do you stand for?"
   - Voice: "Share your Twitter or paste how you write. I'll extract your style."
   - Market: "Who are your competitors? Where do your users hang out?"
   - State: "What phase are you in? What are your top priorities?"
5. Populate files from answers
6. Initialize empty memory index
7. Ready to operate

Don't rush setup. The cofounder match is the foundation — it shapes the entire relationship. Company context builds on top of it.

---

## Context Validation

How to audit, score, and maintain context quality. Stale or incomplete context degrades every agent's output.

### Completeness Checklist

Before marking a context file as "done," verify every required field is present and substantive (not placeholder text).

**founder.md** (`~/.claude/cofounder-memory/founder.md`):
- [ ] Name
- [ ] Archetype (one of: Builder, Designer, Strategist, Storyteller, Operator)
- [ ] Zone of genius (in their own words, specific)
- [ ] Known gaps (specific areas, not vague)
- [ ] Working style (dive in, step back, or talk through — with implication)
- [ ] Partnership preference (challenge, complement, or amplify — with implication)
- [ ] Key insight (one sentence synthesis that captures the dynamic)

**cofounder.md** (`~/.claude/cofounder-memory/cofounder.md`):
- [ ] Name (not generic — has personality)
- [ ] Archetype (complementary to founder's archetype)
- [ ] Personality (2-3 sentences, first person, specific enough to act on)
- [ ] Primary focus (3-4 departments, aligned with founder's gaps)
- [ ] Communication style (directness, push-back level, autonomy — each specified)
- [ ] Signature behavior (one specific habit)
- [ ] What they never do (at least 1 anti-pattern)

**product.md:**
- [ ] Product name
- [ ] One-liner description
- [ ] Problem statement (specific pain, not generic)
- [ ] Target user (who, what they care about, where they are, current solution)
- [ ] Core features (at least 3, with what each does and why it matters)
- [ ] Technical stack (frontend, backend, database, hosting, key integrations)
- [ ] Roadmap (at least 2 milestones with rough timelines)
- [ ] Key metrics (at least 3, with current values)

**brand.md:**
- [ ] Company name
- [ ] Tagline
- [ ] Mission (one sentence)
- [ ] Values (3-5, each with practical meaning — not just the word)
- [ ] Personality description (2-3 sentences someone could "act as")
- [ ] Visual identity (colors with hex codes, typography, imagery style)
- [ ] Positioning statement (for [who], [product] is the [what] that [why], unlike [alternatives])
- [ ] Brand don'ts (at least 2 specific things to avoid)

**voice.md:**
- [ ] Tone (3-5 adjectives)
- [ ] Writing principles (at least 3, with concrete guidance — not just "be clear")
- [ ] Platform variations (at least 3 platforms with specific adaptation notes)
- [ ] Examples (at least 3 real writing samples — tweets, blog intros, emails, etc.)
- [ ] Words we use (at least 3, with what they replace)
- [ ] Words we never use (at least 3, with why)

**market.md:**
- [ ] Market category
- [ ] Competitors (at least 2, with positioning, strength, weakness, pricing)
- [ ] Our differentiation (specific and defensible, not marketing fluff)
- [ ] ICP demographics (role, company size, industry)
- [ ] ICP psychographics (values, frustrations, aspirations)
- [ ] ICP behaviors (where they learn, buy, evaluate)
- [ ] Distribution channels (at least 2, with current traction)
- [ ] Market trends (at least 2, classified as tailwind or headwind)

**state.md:**
- [ ] Current phase (pre-launch, beta, growth, scaling)
- [ ] Top priorities (at least 3, ordered by importance)
- [ ] Key metrics snapshot (at least 3, with trend direction)
- [ ] Active work (at least 2 departments with current status)
- [ ] Blockers (at least 1, with what would unblock it)
- [ ] Recent wins (at least 1)

### Context Freshness Rules

Context files decay at different rates. Stale context is worse than no context — it gives agents confidence in outdated information.

| File | Stale After | Refresh Trigger | How to Refresh |
|------|-------------|-----------------|----------------|
| founder.md | Rarely stale | Founder's self-assessment shifts (new skills, changed focus) | Run `/recalibrate` to update founder profile |
| cofounder.md | Rarely stale | Founder wants to adjust the relationship dynamic | Run `/recalibrate` to adjust identity |
| state.md | 1 week | Any priority shift, metric change, or blocker resolved | Run `/sync` — it updates state.md automatically |
| product.md | Feature launch | Shipping a new feature, changing the stack, or adjusting the roadmap | Run `/brief` and describe what changed |
| market.md | 1 month | New competitor, market shift, updated positioning | Run `/compete` or update manually after market research |
| brand.md | Rarely stale | Pivot, rebrand, or values shift | Run `/brief` — only update on significant identity changes |
| voice.md | Major tone shift | Conscious decision to change how you communicate | Update manually or run `/brief` with writing samples |

**Freshness signals to watch for:**
- Roadmap items in product.md that already shipped — update or remove them
- Metrics in state.md from more than 2 weeks ago — numbers are stale
- Competitors in market.md that have pivoted, been acquired, or shut down
- Priorities in state.md that are marked "in progress" but have been done for a week
- Active work sections that describe work from a previous sprint

### Context Quality Scoring

Score each context file on three dimensions, 1-5 scale:

**Completeness** (are all required fields present and filled in?):
- 5: Every field present with substantive content
- 4: All required fields present, one or two are thin
- 3: Missing 1-2 required fields
- 2: Missing 3+ required fields
- 1: Skeleton/template with mostly placeholders

**Specificity** (are entries concrete and actionable, or vague?):
- 5: Numbers, names, dates, examples everywhere. An agent could act on this immediately.
- 4: Mostly specific, a few entries could be sharper
- 3: Mix of specific and generic. Some entries are filler.
- 2: Mostly generic. Reads like it could apply to any company.
- 1: Pure platitudes. "We help people do things better."

**Freshness** (does the content reflect current reality?):
- 5: Updated within the appropriate freshness window (see table above)
- 4: Slightly behind but core info is still accurate
- 3: One or two sections are outdated but the rest is current
- 2: Multiple sections are stale — shipped features still on roadmap, old metrics, resolved blockers listed
- 1: Entire file describes a previous phase or version of the company

**Overall context health** = average score across all 5 files (each file's score = average of its 3 dimensions):

| Score | Status | Action |
|-------|--------|--------|
| 4.0 - 5.0 | Healthy | Keep the rhythm. Refresh on schedule. |
| 3.0 - 3.9 | Needs attention | Identify which files are dragging the score down. Spend 15 minutes updating. |
| 2.0 - 2.9 | Context emergency | Agent output quality is degraded. Block other work and fix context files first. |
| < 2.0 | Broken | Effectively operating without context. Re-run setup flow from scratch. |

### Common Context Problems

Problems that consistently degrade agent output, and how to fix them:

**Vague positioning**
- Symptom: brand.md positioning reads "We help businesses improve their workflows"
- Impact: Every agent produces generic, interchangeable content
- Fix: Use the positioning formula — for [specific who], [product] is the [specific category] that [specific benefit], unlike [specific alternatives] which [specific limitation]

**Missing metrics**
- Symptom: state.md has priorities but no numbers. product.md lists features but no usage data.
- Impact: Agents can't prioritize, can't set targets, can't measure progress. Recommendations are untethered from reality.
- Fix: Add at least 3 metrics with current values and trend direction. Even rough estimates ("~500 weekly users") are better than nothing.

**Stale roadmap**
- Symptom: product.md roadmap lists features that shipped weeks or months ago
- Impact: Agents recommend building things that already exist, or prioritize work that's already done
- Fix: After every launch, update product.md. Move shipped items to a "Recently shipped" section or remove them. Add what's next.

**Generic voice**
- Symptom: voice.md describes tone as "professional, friendly, helpful" with no examples
- Impact: All generated content sounds like every other startup. No distinctive voice. Everything is beige.
- Fix: Paste 5 real writing samples from the founder. Add specific words-we-use and words-we-never-use lists. The examples matter more than the adjectives.

**Missing competitors**
- Symptom: market.md has 0-1 competitors, or the "competition" section says "we don't really have direct competitors"
- Impact: Positioning is impossible without contrast. Content lacks differentiation. Growth strategies are unfocused.
- Fix: Every product has competition — even if it's "doing nothing" or "using a spreadsheet." List at least 3 alternatives your ICP considers, including the status quo.

**Orphaned blockers**
- Symptom: state.md lists blockers that were resolved weeks ago but never removed
- Impact: Agents waste time proposing solutions to solved problems. Priority signals are noisy.
- Fix: When a blocker is resolved, move it to "Recent wins" or delete it. Blockers should reflect what's stuck right now.

**Template residue**
- Symptom: Context files still contain placeholder text like "{your product name}" or "{what they care about}"
- Impact: Agents may interpret placeholders literally or skip the section entirely
- Fix: Search all context files for curly braces `{}` and fill in every placeholder. If you don't have the info yet, delete the placeholder and add a TODO comment instead.

---

## Memory Scopes

Memory is organized into three scopes so that learnings end up in the right place and follow the right people. For the full reference, see `.cofounder/skill/references/memory-scopes.md`.

### Three Scopes

| Scope | Location | Committed to Git | Purpose |
|-------|----------|-----------------|---------|
| User | `~/.claude/cofounder-memory/` | No | Cross-project learnings, personal preferences, voice patterns |
| Project | `.cofounder/memory/` | Yes (optional) | Architecture decisions, codebase patterns, product learnings |
| Local | `.cofounder/memory-local/` | No (.gitignored) | Personal notes, WIP learnings, sensitive info |

### Directory Structure

```
# User scope — global, lives outside the project
~/.claude/cofounder-memory/
├── index.md
├── voice-patterns.md
├── tool-preferences.md
├── engineering-style.md
└── {domain}.md

# Project scope — project-specific, the existing memory directory
.cofounder/memory/
├── index.md
├── engineering.md
├── product.md
├── marketing.md
└── {domain}.md

# Local scope — personal, never committed
.cofounder/memory-local/
├── notes.md
├── preferences.md
└── {anything}.md
```

### Retrieval Order

When an agent starts a session, memory scopes are read in this order:

1. **User scope** — baseline preferences and cross-project patterns
2. **Project scope** — project-specific knowledge and decisions
3. **Local scope** — personal overrides, WIP notes, sensitive context

When scopes conflict, **project scope overrides user scope** for this project. Project-specific decisions were made for a reason and take precedence over personal preferences.

### Scope Classification

Before saving any learning, classify it:

- "Would this be useful in a different project?" — **User scope**
- "Is this specific to this codebase/product?" — **Project scope**
- "Is this personal/sensitive/temporary?" — **Local scope**
- "Not sure?" — **Project scope** (safe default)

### Gitignore

Add to `.gitignore` at the project root:

```
# Local memory scope — personal, never committed
.cofounder/memory-local/
```

The user scope lives outside the project directory (`~/.claude/cofounder-memory/`) and is never in any git repo. The project scope (`.cofounder/memory/`) is committed or not at the team's discretion.

### Lifecycle

Capture (identify learning) -> Classify (pick scope) -> Store (write to scope directory) -> Index (update scope's index.md) -> Retrieve (agents read on session start) -> Prune (context-keeper audits periodically).

The context-keeper agent manages all three scopes. See `.cofounder/agents/memory/context-keeper.md` for playbooks including scope migration and scope auditing.
