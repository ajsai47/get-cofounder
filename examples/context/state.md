# State

**Phase**: Growth
**Updated**: 2026-03-01

## Priorities
1. **Ship AI Features Kit (v2.1)** — AI chat component, usage-based billing, prompt management. This is our key differentiator and the #1 requested feature.
2. **Grow Twitter to 5K followers** — Build-in-public content driving 70% of traffic. Currently at 3,200. Need consistent posting cadence.
3. **Reduce churn from 3.2% to 2.5%** — Exit surveys show top reason is "missing feature X" — most are addressed in v2.1.

## Key Metrics
- **MRR**: $4,200 (up 22% MoM — was $3,440 last month)
- **Total customers**: 340 (up from 285 — 55 new this month)
- **Pro plan**: 180 customers ($24/mo)
- **Starter plan**: 160 customers (one-time $99)
- **Churn**: 3.2% monthly (up from 2.8% — investigating)
- **GitHub stars**: 1,200 (up from 980)
- **Twitter followers**: 3,200

## Active Work
- **Engineering**: AI chat component 60% complete. Drizzle migration for usage tracking done. Stripe usage-based billing API integration in progress.
- **Product**: v2.2 multi-tenant spec drafted, awaiting review after v2.1 ships.
- **Marketing**: Weekly build-in-public threads performing well (avg 15K impressions). Blog post on "AI-native SaaS architecture" drafted.
- **Design**: AI chat component UI finalized. Dashboard refresh mockups started.
- **Operations**: Sentry error volume down 40% after last bugfix sprint. Support tickets averaging 8/week.

## Blockers
- **Stripe usage-based billing**: Metered billing API documentation is unclear on proration. Need to spike on this before implementing. (~2 hours)
- **AI chat streaming**: Vercel AI SDK streaming works in dev but intermittent in production edge functions. Debugging.

## Recent Wins
- Shipped Stripe billing portal integration — support tickets for subscription management dropped 80%
- Blog post "Why We Chose Drizzle Over Prisma" hit #2 on Hacker News — 45K views, 28 new customers
- NPS improved from 54 to 62 after onboarding flow redesign

## Upcoming
- v2.1 launch — targeting March 15
- Indie Hackers milestone post when hitting $5K MRR
- YouTube tutorial: "Build an AI SaaS in 30 minutes with Shipfast"
