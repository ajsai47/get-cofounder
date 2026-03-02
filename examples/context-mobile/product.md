# Product

## Overview
- **Name**: Steadily
- **One-liner**: Habit tracking that actually sticks — simple streaks, gentle nudges, and weekly reflections that fit into your real life.
- **URL**: https://steadily.app
- **Problem**: People download habit trackers, use them for 8 days, then forget they exist. Existing apps are either too complex (10 fields per habit, charts nobody reads) or too simple (just a checkbox, no motivation to continue). The core problem isn't tracking — it's sustained motivation. Most apps optimize for data entry, not behavior change.

## Target User
- **Who**: Adults 24-40 who want to build better routines. Not productivity nerds — regular people. Mix of young professionals, new parents, and career changers. Skews slightly female (60/40). iPhone primary, Android growing.
- **What they care about**: Feeling like they're making progress without feeling guilty about missed days. Low-friction daily interaction. Privacy — they don't want their habits broadcast to a social feed.
- **Where they are**: Instagram (wellness and self-improvement accounts), TikTok (habit/routine content), YouTube (morning routine and productivity videos), Reddit (r/habits, r/getdisciplined, r/selfimprovement), podcasts (Huberman Lab, The Happiness Lab, Atomic Habits ecosystem).
- **Current solution**: Apple Reminders or Google Keep (no streak tracking), pen-and-paper journals (no nudges, easy to skip), Habitica (too gamified, feels childish), Streaks app (too minimal, no reflection), generic habit apps with 50+ features they never use.

## Core Features
- **Simple streaks**: Add a habit, tap to complete, see your streak grow. Two taps max per habit per day. No forms, no notes required, no friction.
- **Gentle nudges**: Smart notifications that learn your timing patterns. Nudges reduce frequency as habits strengthen. Never guilt-trips — encourages, not shames.
- **Weekly reflection**: Every Sunday, a 2-minute reflection prompt. "What went well? What was hard? What will you adjust?" Builds self-awareness over time.
- **Streak shields**: Miss a day? You get one free shield per week. Protects the streak without breaking accountability. Reduces all-or-nothing thinking.
- **Mood check-in**: Optional daily mood tag (5 emojis). Over time, shows correlation between habits completed and mood trends. The "aha moment" for retention.
- **Focus mode**: Choose 3 core habits. Everything else is hidden until those are solid. Prevents the "add 12 habits on day one" failure pattern.
- **Milestone celebrations**: Confetti at 7 days, a badge at 30, a personalized summary at 100. Small dopamine hits at the right moments.

## Technical Stack
- **Frontend**: React Native 0.76 with Expo SDK 52, TypeScript, NativeWind (Tailwind for RN)
- **Backend**: Supabase (PostgreSQL + Auth + Edge Functions + Realtime)
- **Notifications**: Expo Notifications + custom scheduling engine on Supabase Edge Functions
- **Analytics**: PostHog (self-hosted) for product analytics, RevenueCat for subscription analytics
- **Payments**: RevenueCat managing App Store and Play Store subscriptions
- **Distribution**: App Store (iOS 16+), Google Play Store (Android 10+)
- **CI/CD**: EAS Build + EAS Submit (Expo Application Services), GitHub Actions for linting and testing
- **Monitoring**: Sentry for crash reporting, Supabase dashboard for backend health
- **Design**: Figma for design system, Lottie for micro-animations

## Roadmap
1. **v1.3 — Social Accountability**: Invite a partner to share streak progress (not public, just 1:1). Opt-in only. — ETA 3 weeks
2. **v1.4 — Apple Watch + Widgets**: Complete habits from the watch face or home screen widget. Reduce app-open friction to zero. — ETA 6 weeks
3. **v1.5 — Smart Habit Suggestions**: Based on mood correlations and completion patterns, suggest habit adjustments. "You complete 'Morning Walk' 90% of the time — try adding 'Stretch After Walk.'" — ETA 8 weeks
4. **v2.0 — Steadily Coaching**: AI-powered weekly coaching summaries. Personalized nudge timing. Habit stacking recommendations. Premium feature. — ETA Q3

## Key Metrics
- **Beta users**: 2,800 (TestFlight 1,900 + Google Play beta 900)
- **DAU**: 1,100 (39% of beta users active daily)
- **D7 retention**: 52% (industry average for habit apps: 20-25%)
- **D30 retention**: 31% (industry average: 8-12%)
- **Habits tracked per user**: 3.4 average (focus mode working — prevents overload)
- **Weekly reflection completion**: 44% of active users complete Sunday reflection
- **App Store rating**: 4.7 (TestFlight feedback equivalent, from in-app surveys)
- **Crash-free rate**: 99.2%

## Repos
- **Mobile app**: github.com/steadily-app/steadily (React Native monorepo)
- **Backend**: Supabase project (managed, no separate repo — migrations in mobile repo under /supabase)
- **Landing page**: github.com/steadily-app/website (Astro, deployed on Vercel)
