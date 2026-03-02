# Voice

## Tone
Direct, warm, technically confident, slightly irreverent, action-oriented

## Writing Principles
- **Short sentences. Then shorter ones.** Punch, don't meander. If a paragraph is more than 3 sentences, break it up.
- **Active voice always.** "You configure the database" not "The database can be configured."
- **Show with code, not words.** A 3-line code example is worth a paragraph of explanation.
- **Respect the reader's time.** Every sentence earns its place. Cut the filler. Cut the qualifiers. Cut "basically" and "essentially."
- **Opinions are features.** We have strong opinions on tools, patterns, and approaches. State them. "Use Drizzle" not "You might consider Drizzle among other options."

## Platform Variations
- **Twitter/X**: Punchiest version. One clear idea per tweet. Threads for tutorials. Hot takes on developer tools. Build-in-public updates with real numbers.
- **Blog/Newsletter**: More depth but still concise. Lead with the insight, not the backstory. Code examples in every technical post. Personal stories when they illustrate a point.
- **Documentation**: Zero ambiguity. Step-by-step. Every code example is runnable. Assume the reader is in the middle of building and needs answers fast.
- **Product UI**: Minimal. Helpful. Clear actions. Error messages that tell you what to do, not just what went wrong. Example: "API key is invalid. Generate a new one in Settings → API." not "Authentication error."
- **Email**: Like writing to one developer friend. No "Dear valued customer." First name, straight to the point, one clear CTA.

## Examples

### Example 1 (Twitter)
> Spent 3 days evaluating ORMs for our new project. The answer is always Drizzle. Type-safe, SQL-like, tiny bundle. Stop evaluating, start building.

### Example 2 (Blog intro)
> Every SaaS boilerplate promises to save you time. Most of them cost you time — in config files, version mismatches, and patterns you'll fight against for the life of the project. Here's what we built instead, and why.

### Example 3 (Changelog)
> **Stripe billing portal is live.** Your users can now manage their own subscriptions — upgrade, downgrade, cancel, update payment method. Zero code on your end. Just set the environment variable and it works.

### Example 4 (Error message)
> Couldn't connect to the database. Check that DATABASE_URL is set in your .env file and the database is running. Run `npx shipfast db:check` to diagnose.

### Example 5 (Email)
> Hey {name} — Quick heads up: we shipped webhook handling this week. If you've been manually polling for Stripe events, you can delete that code now. Here's the 2-minute setup: [link]

## Words We Use
- **ship** (instead of "deploy" or "release")
- **straightforward** (instead of "easy" or "simple")
- **builder** (instead of "user" or "customer")
- **starter kit** (instead of "boilerplate" or "template")
- **just works** (when describing DX that requires zero config)

## Words We Never Use
- **leverage** — corporate speak
- **ecosystem** — meaningless
- **scalable solution** — every solution is "scalable" until it isn't
- **cutting-edge** — what year is this
- **empower** — we help people build things, we don't "empower" them
- **hey there!** — too many exclamation marks, too generic

## Signature Patterns
- Start tweets with a strong statement, not a question
- Use "→" for step sequences instead of numbered lists in short-form
- Sign emails with just the first name, no title
- Changelogs lead with the user benefit, not the technical change
