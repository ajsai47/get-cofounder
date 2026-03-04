# Changelog

All notable changes to Cofounder.

## [Unreleased]

### Added
- **Sales department** — 11th department with 3 new agents covering the full sales lifecycle:
  - `outbound-strategist` — Prospect identification, ICP targeting, multi-channel sequences, personalization at scale, LinkedIn social selling, re-engagement campaigns
  - `deal-closer` — Pipeline management, BANT + MEDDIC qualification, proposal generation, pricing strategy, objection handling, battle cards, win/loss analysis
  - `partnership-manager` — Partner identification and evaluation, co-selling motions, integration partner outreach, customer expansion and upsell, referral program design
- **Sales ↔ Marketing boundary** — Growth Hacker owns product-led growth and mass acquisition; Sales owns 1:1 relationship-driven outreach, deal management, and revenue closing. Handoff: when a lead goes from "interested" to "in a deal"
- **Sales routing logic** in departments.md — "Close a deal", "Find prospects", "Build partnerships" all route to Sales
- **Sales handoff patterns** in coordination-map.md — 7 new cross-department handoffs (Marketing → Sales, Sales → Product, Sales → Memory, etc.)
- **Sales orchestration** — 2 new multi-department workflows (Close a Deal, Build a Partnership) and 2 new feedback loops (Sales Pipeline, Partnership Loop)
- **Decision Journal system** — Structured, append-only `journal.json` for tracking decisions across all three memory scopes (user, project, local)
  - Auto-captured from `/plan` (tech decisions), `/research` (GO verdicts), `/retro` (decision review + outcome tracking)
  - Manual capture via `/decide` command
  - Queryable by title, tags, departments, date range
  - Status tracking: active → superseded / revisit / reversed
  - Session auto-detection of decision signals in context-keeper
- `/decide` command — Capture, structure, and track decisions with full context
- Decision review section in `/retro` — Reviews sprint decisions, updates outcomes and status
- Recent decisions and pending reviews in `/sync` output

### Changed
- Department count: 10 → 11
- Agent count: 31 → 34
- Updated install.sh banner
- Updated SKILL.md, departments.md, coordination-map.md, orchestration-diagrams.md
- `/plan` now captures tech decisions to Decision Journal (new step 8)
- `/research` now captures GO verdicts to Decision Journal (new step 6)
- `/retro` now includes Decision Review phase (new step 4)
- `/sync` now surfaces recent decisions and pending reviews (new step 4)
- context-keeper Playbook 5 upgraded to write to Decision Journal with detection signals
