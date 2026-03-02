# State

**Phase**: Open-source growth (pre-revenue, building toward paid tier)
**Updated**: 2026-03-01

## Priorities
1. **Ship OpenAPI Import (v1.4)** — Auto-generate test stubs from OpenAPI specs. Most-requested feature on GitHub (47 thumbs-up). Removes the biggest adoption friction: writing the first test file from scratch.
2. **Grow to 5K GitHub stars** — Currently at 3,400. Stars drive discoverability, contributor interest, and credibility for the upcoming Pro launch. Target: 5K by end of Q2.
3. **Build Pipecheck Cloud MVP** — Hosted test scheduling, team dashboards, and monitoring. This is the revenue play. Pro waitlist at 340. Need working prototype by end of April to start design partner conversations.

## Key Metrics
- **GitHub stars**: 3,400 (up from 2,900 — 500 new this month after GopherCon talk)
- **Weekly downloads**: 8,500 (Homebrew 5,200 + npm 2,800 + direct binary 500)
- **Monthly active users**: ~2,100 (opt-in telemetry, estimated 3-4x actual)
- **Contributors**: 42 total, 12 regular (PRs in last 30 days)
- **Open issues**: 67 (23 feature requests, 18 bugs, 26 questions/discussions)
- **GitHub Sponsors**: $620/month (8 sponsors — 2 companies, 6 individuals)
- **Pro waitlist**: 340 signups (conversion target: 15-20% at $29/mo)
- **Docs traffic**: 12K monthly visitors (up 30% after adding search)

## Active Work
- **Engineering**: OpenAPI import parser 70% complete. YAML codegen from spec working for REST endpoints. GraphQL introspection support next. Watch mode prototype started as a side branch.
- **Community**: Reviewing 6 open PRs. Three new plugin submissions (JWT decode, XML assert, rate-limit tester). Triaging GopherCon-driven issue surge.
- **Docs**: Migration guide from Postman collections to Pipecheck YAML in progress. CI integration guides updated for GitHub Actions v4.
- **Marketing**: GopherCon talk recording published — 4.2K views in first week. Blog post "Why We Chose YAML Over a Custom DSL" drafted. Planning Show HN for v1.4 launch.
- **Cloud**: Architecture design for Pipecheck Cloud — scheduled runs, result storage, team workspaces. Evaluating Neon + Fly.io for backend. Stripe integration for subscriptions.

## Blockers
- **OpenAPI 3.1 edge cases**: Some specs use JSON Schema `$ref` heavily and the parser chokes on circular references. Need to handle or skip gracefully. (~1 day of work)
- **Cloud auth model**: Undecided between API key auth (simple, stateless) and OAuth (richer, but complex). Affects the entire cloud architecture. Need to decide this week.
- **Contributor CLA**: Two corporate contributors need a CLA before their PRs can merge. Legal template not finalized yet.

## Recent Wins
- GopherCon talk "API Testing Without the GUI" — standing room only, 4.2K YouTube views, 500 new stars in 2 weeks
- Snapshot testing (v1.3) adoption faster than expected — 23% of active users enabled it within first month
- First corporate GitHub Sponsor — $200/month from a fintech startup using Pipecheck in their CI
- Community plugin system launched — 8 plugins submitted in first 3 weeks

## Upcoming
- v1.4 launch — targeting March 20, with Show HN post same day
- Design partner outreach for Pipecheck Cloud — 10 conversations with waitlist companies
- Blog post: "From Postman to Pipecheck: A Migration Guide" — publish week of March 10
- Apply to GitHub Accelerator program (deadline April 1)
