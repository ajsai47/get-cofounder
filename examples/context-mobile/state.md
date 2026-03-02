# State

**Phase**: Late beta (preparing for public launch)
**Updated**: 2026-03-01

## Priorities
1. **Prepare for App Store launch (v1.2 GA)** — TestFlight beta is stable, metrics are strong. Polish onboarding, fix remaining crash on Android 10, finalize App Store listing copy and screenshots. Target launch: March 20.
2. **Hit 60% D7 retention before launch** — Currently at 52%. Hypothesis: improving the day-2 and day-3 nudge sequence will close the gap. Running A/B test on notification timing and copy.
3. **Build pre-launch audience to 5K** — Email waitlist at 2,400, Instagram at 1,800 followers. Need coordinated push: landing page optimization, 3 influencer partnerships confirmed, TikTok content calendar for launch week.

## Key Metrics
- **Beta users**: 2,800 total (1,900 TestFlight + 900 Google Play beta)
- **DAU**: 1,100 (39% of total beta — healthy for beta phase)
- **D1 retention**: 71% (up from 64% after onboarding redesign)
- **D7 retention**: 52% (target: 60% before launch)
- **D30 retention**: 31% (2.5x industry average — strongest metric)
- **Habits per user**: 3.4 average (focus mode keeping this manageable)
- **Weekly reflection completion**: 44% of weekly actives
- **Crash-free rate**: 99.2% (iOS 99.6%, Android 98.4% — Android needs work)
- **NPS**: 58 (from in-app survey, 340 responses)
- **Email waitlist**: 2,400 signups
- **Estimated launch-day downloads**: 800-1,200 (based on waitlist conversion benchmarks)

## Active Work
- **Engineering**: Android 10 crash fix in progress (race condition in notification scheduler). Performance optimization pass — app startup time reduced from 2.1s to 1.4s. RevenueCat paywall integration complete, testing purchase flows.
- **Product**: Onboarding A/B test running (conversational flow vs. traditional wizard). Streak shield UX refinement based on beta feedback — users weren't discovering it. Adding tooltip on first missed day.
- **Design**: App Store screenshots (6 screens, 2 variants for A/B). Launch video (15-second preview). Dark mode polish pass — some screens had contrast issues.
- **Marketing**: 3 micro-influencer partnerships confirmed (wellness niche, 8K-25K followers each). Launch blog post drafted: "Why We Built Another Habit App." Instagram content calendar loaded for launch week (7 posts). Press kit assembled.
- **Operations**: App Store review submission in 5 days. Google Play listing finalized. Privacy policy and terms of service reviewed by legal. Supabase scaling plan confirmed for launch traffic (can handle 10x current load).

## Blockers
- **Android 10 crash**: Notification scheduler race condition. Affects ~3% of Android beta users. Must fix before launch — bad reviews on day one are permanent. Estimated fix: 1-2 days.
- **Apple App Review uncertainty**: First submission. Hearing mixed reports on review times (1-7 days). Submitting March 13 for March 20 target launch. No fallback plan if rejected — need to pad timeline.
- **Influencer content timing**: Two of three influencers haven't confirmed exact post dates. Need their content to go live on launch day for maximum App Store algorithm impact.

## Recent Wins
- D30 retention hit 31% — 2.5x the industry average. Validates core product-market fit. Streak shields and weekly reflections are working.
- App startup time reduced from 2.1s to 1.4s after lazy-loading the reflection module. Users commented on it in beta feedback.
- First organic TikTok mention by a wellness creator (unpaid) — 18K views, 140 beta signups in 2 days. Proof that the product is "TikTok-able."
- Onboarding redesign increased D1 retention from 64% to 71%. Conversational flow ("What's one habit you want to start?") outperformed the feature tour.

## Upcoming
- App Store submission — March 13
- Public launch — March 20 (coordinated: App Store + Product Hunt + influencer posts + email blast)
- Post-launch: monitor reviews daily for first 2 weeks, hotfix anything critical within 24 hours
- v1.3 (Social Accountability) development starts March 24 — the growth loop feature
- First paid marketing test (Instagram ads, $500 budget) — April 1, once organic benchmarks are established
