# Product

## Overview
- **Name**: Shipfast
- **One-liner**: Full-stack SaaS starter kit — auth, payments, emails, and deployment, configured and ready to ship.
- **URL**: https://shipfast.dev
- **Problem**: Developers spend 2-4 weeks on SaaS boilerplate (auth, payments, email, deployment) before writing a single line of product code. Most give up or ship with a fragile, cobbled-together foundation.

## Target User
- **Who**: Solo developers and small teams (1-3 people) building SaaS products. Ages 22-40. Mix of experienced developers and ambitious beginners.
- **What they care about**: Shipping fast, clean code, not getting locked into bad patterns, keeping costs low, making money from their side projects.
- **Where they are**: Twitter dev community, Indie Hackers, Hacker News, r/SaaS, r/nextjs, dev Discord servers, YouTube coding channels.
- **Current solution**: Copy-paste from old projects, use free boilerplates (incomplete), or spend weeks building from scratch. Some use competing starter kits but find them bloated or poorly maintained.

## Core Features
- **Auth**: Clerk integration with social login, magic links, and role-based access out of the box
- **Payments**: Stripe subscriptions with billing portal, webhook handling, and usage-based billing support
- **Email**: Transactional emails via Resend, with React Email templates
- **Database**: Neon PostgreSQL with Drizzle ORM, migrations, and seed scripts
- **Landing page**: Conversion-optimized landing page with pricing, testimonials, FAQ sections
- **Dashboard**: Authenticated dashboard layout with sidebar navigation, settings, billing management
- **Deployment**: One-click Vercel deployment with environment variable configuration

## Technical Stack
- **Frontend**: Next.js 15, React 19, TypeScript, Tailwind CSS 4, shadcn/ui
- **Backend**: Next.js API routes, Server Actions, tRPC for type-safe APIs
- **Database**: PostgreSQL on Neon, Drizzle ORM
- **Auth**: Clerk
- **Payments**: Stripe
- **Email**: Resend + React Email
- **Hosting**: Vercel
- **CI/CD**: GitHub Actions (lint, type check, test on PR; deploy on merge to main)
- **Monitoring**: Sentry for errors, Vercel Analytics for traffic
- **Key integrations**: Stripe webhooks, Clerk webhooks, Resend API

## Roadmap
1. **v2.1 — AI Features Kit**: Add AI chat component, usage-based billing for AI calls, prompt management — ETA 2 weeks
2. **v2.2 — Multi-tenant**: Workspace/team support, invite flows, role management — ETA 4 weeks
3. **v2.3 — Mobile**: React Native companion with shared auth and API — ETA 6 weeks
4. **v3.0 — Marketplace**: Plugin system for community-contributed feature kits — ETA Q3

## Key Metrics
- **MRR**: $4,200 — growing 22% MoM
- **Total customers**: 340 — 180 on Pro plan
- **GitHub stars**: 1,200
- **Churn**: 3.2% monthly
- **NPS**: 62

## Repos
- **Main**: github.com/shipfast/shipfast (monorepo)
- **Website**: github.com/shipfast/website (Next.js marketing site)
- **Docs**: github.com/shipfast/docs (Nextra documentation)
