<div align="center">

```
  ___ ___  ___ ___  _   _ _  _ ___  ___ ___
 / __/ _ \| __/ _ \| | | | \| |   \| __| _ \
| (_| (_) | _| (_) | |_| | .` | |) | _||   /
 \___\___/|_| \___/ \___/|_|\_|___/|___|_|_\
```

</div>

<p align="center">
  <strong>Your AI co-founder. 11 departments. 34 agents. One shared brain.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-compatible-blueviolet" alt="Claude Code compatible" />
  <img src="https://img.shields.io/badge/departments-11-blue" alt="11 departments" />
  <img src="https://img.shields.io/badge/agents-34-blue" alt="34 agents" />
  <img src="https://img.shields.io/badge/commands-12-blue" alt="12 commands" />
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT license" />
</p>

---

You're one person running every department. CEO, engineer, marketer, designer, support, ops -- all you. Cofounder gives you a full AI-native org inside Claude Code. Type `/cofounder` and you have a technical co-founder who orchestrates 34 specialized agents across 11 departments, all pulling from a shared brain that knows your brand, your voice, your product, your market, and your current priorities.

Session 1 is good. Session 50 is transformative -- because the system remembers everything it learns.

## Install

```bash
gh repo clone ajsai47/get-cofounder ~/.cofounder && bash ~/.cofounder/install.sh
```

> Requires [GitHub CLI](https://cli.github.com/) authenticated with repo access. Ask [@AJs_AI](https://x.com/AJs_AI) for access.

That's it. Open Claude Code in any project. Type `/cofounder`. Follow the 5-minute setup.

## What It Does

Here's a Tuesday morning with Cofounder:

```
You:  /sync
      -- Engineering reports: auth flow shipped, needs testing
      -- Marketing reports: blog post drafted, awaiting brand review
      -- Product reports: 3 user feedback signals pointing to onboarding friction
      -- Operations reports: error rate up 2% since last deploy
      Cofounder recommends: fix the error rate spike first, then ship the auth flow
      tests, then tackle onboarding -- that's where users are churning.

You:  "Write a launch announcement for the auth flow"
      -- Content Creator drafts the blog post (reads voice.md)
      -- Social Strategist drafts Twitter thread + LinkedIn post (reads voice.md)
      -- Brand Guardian reviews everything for consistency (reads brand.md)
      -- All three produce output that sounds like YOU wrote it.

You:  "Is the pricing page converting?"
      -- Analytics Reporter pulls the data
      -- Growth Hacker analyzes the funnel
      -- Sprint Prioritizer recommends: "move social proof above the fold --
         here's why, here's the evidence from similar SaaS products"

You:  /launch
      -- Full cross-department coordination: code deployed, monitoring live,
         announcement scheduled, support docs updated, analytics tracking set.
```

One person. Full startup output. No context switching between ChatGPT tabs.

## Features

### Cofounder Match
Your first interaction is a 5-question assessment. What's your zone of genius? What drains you? How do you like to work? The system generates a complementary AI cofounder -- with a name, an archetype, and a personality shaped by your gaps. A builder gets an Operator. A storyteller gets an Architect. Not a generic assistant. A specific person who fills the roles you can't.

### Shared Brain
Every agent reads from the same context files -- your brand identity, writing voice, product details, market positioning, and current priorities. A blog post sounds like your tweet thread sounds like your support response because they all pull from the same `voice.md`.

### Compounding Memory
The system captures what works and what doesn't. Which content converts. Which engineering patterns scale. What users actually say. This memory persists across sessions and compounds over time.

### Cross-Department Orchestration
Real work spans departments. "Launch a feature" touches Engineering, Testing, Marketing, Design, and Operations. Cofounder routes work to the right agents, runs independent tracks in parallel, and synthesizes results.

### AI-Native by Default
MCP servers over custom integrations. AI-friendly tools over legacy alternatives. The AI Adapter department exists specifically to keep your stack ahead of the curve.

### Opinionated Co-founder
This isn't a yes-man. When you're wrong, it says so -- with evidence. When perfectionism is blocking progress, it calls it out. When a "feature request" is actually a marketing problem, it redirects.

## Departments

| Department | Agents | What They Do |
|:-----------|:------:|:-------------|
| **Engineering** | 5 | Frontend, backend, AI, DevOps, rapid prototyping |
| **Product** | 3 | Market research, feedback synthesis, sprint prioritization |
| **Marketing** | 5 | Content, social strategy, growth, community, ASO |
| **Design** | 3 | UI design, UX research, brand consistency |
| **Project Mgmt** | 2 | Shipping cadence, experiment tracking |
| **Operations** | 5 | Support, analytics, infrastructure, legal, finance |
| **Testing** | 3 | Test engineering, performance, tool evaluation |
| **Memory** | 1 | Persistent context across sessions |
| **AI Adapter** | 2 | AI-native stack advisor, tool scouting |
| **Sales** | 3 | Outbound prospecting, deal closing, partnerships |
| **Validation** | 2 | Quality gates — constitutional validation, code review |

### All 34 Agents

**Engineering** -- `frontend-developer` `backend-architect` `ai-engineer` `devops-automator` `rapid-prototyper`

**Product** -- `trend-researcher` `feedback-synthesizer` `sprint-prioritizer`

**Marketing** -- `content-creator` `social-strategist` `growth-hacker` `community-builder` `app-store-optimizer`

**Design** -- `ui-designer` `ux-researcher` `brand-guardian`

**Project Mgmt** -- `project-shipper` `experiment-tracker`

**Operations** -- `support-responder` `analytics-reporter` `infrastructure-maintainer` `legal-compliance` `finance-tracker`

**Testing** -- `test-engineer` `performance-engineer` `tool-evaluator`

**Memory** -- `context-keeper`

**AI Adapter** -- `tech-advisor` `tool-scout`

**Sales** -- `outbound-strategist` `deal-closer` `partnership-manager`

**Validation** -- `constitutional-validator` `code-reviewer`

## Commands

| Command | What It Does |
|:--------|:-------------|
| `/cofounder` | Start a session. Recovers context, orients to current state, asks what to work on. |
| `/sync` | Daily standup. All departments report status, blockers surface, priorities align. |
| `/brief` | Update company context. Brand evolved? New competitor? Priorities shifted? Update the shared brain. |
| `/launch` | Ship to production. Full cross-department coordination with readiness checks. |
| `/pitch` | Generate pitch deck content, one-pagers, investor materials. |
| `/hire` | Define roles, write job descriptions, plan hiring when ready to grow. |
| `/retro` | Sprint retrospective. What shipped, what broke, what to improve. |
| `/compete` | Competitive analysis. Threat assessment, positioning gaps, response strategy. |
| `/metrics` | KPI review. Traffic light scoring, trend analysis, recommended actions. |
| `/research` | Research gate. Evidence-based GO/NO-GO verdict before building. |
| `/plan` | Planning gate. Architecture and design validation before implementation. |
| `/decide` | Decision journal. Capture, structure, and track decisions with full context. |

## How It Works

### The Shared Brain

Every project gets a `.cofounder/` directory -- the shared brain all 34 agents read from.

```
.cofounder/
├── context/                 <- the shared brain
│   ├── founder.md           <- your strengths, gaps, working style
│   ├── cofounder.md         <- your AI cofounder's name, personality, focus
│   ├── brand.md             <- identity, values, visual language, positioning
│   ├── voice.md             <- writing style, tone, platform-specific examples
│   ├── product.md           <- what you're building, tech stack, roadmap
│   ├── market.md            <- competitors, ICP, distribution channels
│   └── state.md             <- current phase, priorities, metrics, blockers
├── memory/                  <- what the system has learned
│   ├── index.md             <- compact lesson index (read every session)
│   └── {domain}.md          <- domain-specific learnings
└── sync/                    <- department coordination
    └── latest.md            <- last standup output
```

### How Agents Use Context

```
                        ┌─────────────────────┐
                        │     THE FOUNDER      │
                        │  "Build a feature"   │
                        └──────────┬──────────┘
                                   │
                        ┌──────────▼──────────┐
                        │     COFOUNDER        │
                        │  Routes & orchestrates│
                        └──────────┬──────────┘
                                   │
               ┌───────────────────┼───────────────────┐
               │                   │                   │
       ┌───────▼───────┐  ┌───────▼───────┐  ┌───────▼───────┐
       │  Engineering   │  │   Marketing   │  │    Testing    │
       │ reads: product │  │ reads: voice  │  │ reads: product│
       │        brand   │  │       brand   │  │       memory  │
       │        memory  │  │       market  │  │               │
       └───────┬───────┘  └───────┬───────┘  └───────┬───────┘
               │                   │                   │
               └───────────────────┼───────────────────┘
                                   │
                        ┌──────────▼──────────┐
                        │    SHARED BRAIN      │
                        │  .cofounder/context/ │
                        │  .cofounder/memory/  │
                        └─────────────────────┘
```

Context flows down. Memory flows up. Every session feeds the brain, and every session benefits from what came before.

### Memory That Compounds

After significant work, the system captures:
- What approach worked and why
- What failed and why
- Patterns to repeat or avoid
- Tools and libraries evaluated

Stored as one-line lessons in `memory/index.md` (compact, read every session) with full details in domain-specific files (loaded on-demand). Session 50 knows your codebase quirks, your brand evolution, what content converts, which engineering patterns scale.

### Three Decision Lenses

Every recommendation runs through three lenses:

1. **Value** -- Does this actually matter? Who wants it? What's the evidence?
2. **Feasibility** -- Can we build it? What's the simplest approach? Maintenance burden?
3. **Leverage** -- What gives us the most with the least? What compounds over time?

For reversible decisions: move fast. For irreversible decisions: slow down and get it right.

## Getting Started

### 1. Install

```bash
gh repo clone ajsai47/get-cofounder ~/.cofounder && bash ~/.cofounder/install.sh
```

### 2. Open Claude Code in your project

```bash
cd your-project
claude
```

### 3. Type `/cofounder`

The setup starts with a **Cofounder Match** -- a quick assessment that figures out who your AI cofounder should be based on your strengths and gaps. Then it walks you through your company context.

1. **Cofounder Match** -- Your zone of genius, your gaps, your working style. Generates a named AI cofounder with a complementary personality.
2. **Product** -- What you're building, for whom, tech stack, roadmap
3. **Brand** -- Identity, values, personality, positioning
4. **Voice** -- Your writing style (it can analyze your Twitter feed or writing samples)
5. **Market** -- Competitors, ICP, distribution channels
6. **State** -- Current phase, priorities, metrics

After setup, your AI cofounder has a name, a personality, and a shared brain. Every agent is ready to work.

### 4. Start building

```
You: "What should I focus on this week?"
You: "Write a blog post about our new feature"
You: "Review this PR for performance issues"
You: "How do we compare to [competitor]?"
You: /sync
```

## Examples

### Example 1: Ship a Feature End-to-End

```
You:  "I want to add a dark mode toggle to the settings page"

      Cofounder routes to:
      1. Design (ui-designer) -- component spec, color tokens, accessibility
      2. Engineering (frontend-developer) -- implements the toggle, CSS variables, persistence
      3. Testing (test-engineer) -- visual regression tests, cross-browser checks
      4. Marketing (content-creator) -- changelog entry, tweet about the update

      Each agent reads brand.md for color system and product.md for tech stack.
      Output is consistent because the brain is shared.
```

### Example 2: Respond to a Competitor Launch

```
You:  "Competitor X just launched a new pricing tier undercutting us"

      Cofounder routes to:
      1. Product (trend-researcher) -- analyzes the competitive move, pricing comparison
      2. Marketing (growth-hacker) -- evaluates impact on our conversion, recommends response
      3. Product (sprint-prioritizer) -- reprioritizes backlog if needed
      4. Marketing (content-creator) -- drafts positioning content highlighting our differentiators

      Updates market.md with the new competitive data.
      Memory captures the response playbook for next time.
```

### Example 3: Prep for a Fundraise

```
You:  /pitch

      Cofounder orchestrates:
      1. Product -- problem/solution narrative, market sizing, traction data
      2. Operations (finance-tracker) -- financial model, unit economics, projections
      3. Operations (analytics-reporter) -- key metrics, growth charts
      4. Marketing -- positioning, competitive landscape, go-to-market strategy
      5. Design (brand-guardian) -- ensures all materials match brand identity

      Outputs: pitch deck narrative, one-pager, financial projections, key metrics summary.
      All in your voice. All consistent with your brand.
```

## Architecture

```
~/.cofounder/                    <- framework source (cloned repo)
├── skill/                       <- the cofounder skill
│   ├── SKILL.md                 <- main skill definition
│   ├── commands/                <- slash commands (/sync, /brief, etc.)
│   ├── references/              <- how the system thinks
│   └── templates/               <- output templates
├── agents/                      <- 34 department agents
│   ├── engineering/             <- 5 agents
│   ├── product/                 <- 3 agents
│   ├── marketing/               <- 5 agents
│   ├── design/                  <- 3 agents
│   ├── project-management/      <- 2 agents
│   ├── operations/              <- 5 agents
│   ├── sales/                   <- 3 agents
│   ├── testing/                 <- 3 agents
│   ├── validation/             <- 2 agents
│   ├── memory/                  <- 1 agent
│   └── ai-adapter/             <- 2 agents
├── hooks/                      <- quality enforcement scripts
└── install.sh                   <- installer + symlinker

~/.claude/skills/cofounder/      <- symlinked to ~/.cofounder/skill/
~/.claude/agents/                <- symlinked departments
~/.claude/commands/              <- symlinked commands
```

Symlinks mean `cd ~/.cofounder && git pull` updates everything instantly. No reinstall needed.

## Principles

These aren't platitudes. They're the operating rules baked into every agent.

- **Ship over perfect.** The 80% solution with real users beats the perfect solution on your laptop. Always.
- **AI-native by default.** MCP servers over custom integrations. If someone's already built it, use it.
- **Context is king.** Consistent output requires consistent context. Stale `brand.md` = inconsistent agents.
- **Memory compounds.** Feed the system. Session 50 should be dramatically better than session 1.
- **Challenge the founder.** A yes-man co-founder is worthless. Good co-founders push back with evidence.
- **Everything connects.** Product decisions affect marketing. Design decisions affect engineering. No department operates in isolation.

## Update

```bash
cd ~/.cofounder && git pull && bash install.sh
```

`git pull` updates existing files instantly via symlinks. Re-running `install.sh` picks up any new commands, departments, or hooks.

## Uninstall

```bash
rm -rf ~/.cofounder ~/.claude/skills/cofounder ~/.claude/hooks/cofounder
for dept in engineering product marketing design project-management operations sales testing memory ai-adapter validation; do
  rm -rf ~/.claude/agents/$dept
done
for cmd in sync brief launch pitch hire retro compete metrics plan research recalibrate decide; do
  rm -f ~/.claude/commands/$cmd.md
done
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- Git

## Contributing

Cofounder is built for solo founders, by a solo founder. Contributions welcome.

**Add a new agent:**
1. Create a markdown file in the appropriate `agents/{department}/` directory
2. Follow the existing agent format (see any agent file for the template)
3. Update `skill/references/departments.md` with the new agent
4. Submit a PR

**Add a new command:**
1. Create a markdown file in `skill/commands/`
2. Include the frontmatter (`name`, `description`)
3. Document the command flow
4. Submit a PR

**Improve the brain:**
- Better prompts, smarter routing, sharper context templates -- all welcome
- Open an issue first for architectural changes

## License

MIT -- do whatever you want with it.

---

<p align="center">
  <strong>Built for the solo founder era.</strong><br/>
  One person. Every department. Shipping at startup speed.
</p>
