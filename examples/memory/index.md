# Memory Index

## Engineering
- [E-001] Next.js 15 App Router: always default to Server Components; only add "use client" for interactive elements
- [E-002] Drizzle ORM + Neon: use connection pooling via `@neondatabase/serverless` in production, direct connection in dev
- [E-003] Stripe webhooks: always verify signatures before processing; use `stripe.webhooks.constructEvent()`, never parse raw body manually
- [E-004] shadcn/ui components: copy into project (not a package dependency). Customize via CSS variables, not by editing component source directly
- [E-005] Vercel AI SDK streaming: works in dev but can be flaky in edge runtime — use nodejs runtime for AI routes if edge gives issues
- [E-006] Pre-commit hooks: Biome for formatting+linting in one pass (faster than ESLint+Prettier), lint-staged for only checking changed files

## Product
- [P-001] Users abandon onboarding at step 3 (payment setup) — adding "skip for now" option increased completion from 34% to 71%
- [P-002] Feature requests for "team support" outnumber all other requests 3:1 — validates v2.2 multi-tenant priority
- [P-003] NPS improved from 54 to 62 after simplifying the initial project setup wizard from 8 steps to 4
- [P-004] Power users want API access; casual users want GUI wizards — serve both, don't force one path

## Marketing
- [M-001] Twitter threads (5-8 tweets) get 3-4x engagement vs single tweets; optimal posting time: 9-10am EST weekdays
- [M-002] "Build a SaaS in X minutes" content format outperforms all other content types on YouTube and Twitter
- [M-003] Hacker News Show HN posts work best Tuesday-Thursday; avoid weekends; title format "[Show HN]: {what it does} ({tech stack})"
- [M-004] Comparison landing pages ("Shipfast vs Competitor") convert at 12% vs 4% for generic landing page — SEO gold
- [M-005] Build-in-public updates with real revenue numbers get 5x more engagement than feature announcements

## Design
- [D-001] Dark mode is expected by developer audience — always implement from day one, not retrofitted later
- [D-002] Code snippet displays must use a monospace font with syntax highlighting; raw text code blocks feel broken
- [D-003] Dashboard sidebar navigation: collapsible with keyboard shortcut (Cmd+B). Users expect it from tools like Linear/Notion
- [D-004] Landing page social proof section (logos, testimonials, GitHub stars) above the fold increases conversion 18%

## Operations
- [O-001] Sentry free tier handles our error volume fine up to ~5K events/month; upgrade when exceeding
- [O-002] Support tickets spike on Mondays (users try product over weekend, hit issues) — front-load Monday support capacity
- [O-003] Vercel Pro plan worth it at our traffic level for analytics and 100GB bandwidth; would need Enterprise at ~50K MAU
- [O-004] Database backups: Neon handles point-in-time recovery automatically; also do weekly pg_dump to a private S3 bucket

## Meta
- [X-001] When in doubt, ship the simpler version first. Every "let's add this one more thing" before launch delays by average 3 days
- [X-002] The Drizzle blog post success (HN #2, 28 new customers) proves opinionated technical content is our best acquisition channel
- [X-003] Stripe integration issues account for 40% of support tickets — any investment in Stripe DX pays off across support, engineering, and retention
