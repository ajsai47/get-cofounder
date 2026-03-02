# Voice

## Tone
Precise, concise, technically confident, dry wit, no-nonsense

## Writing Principles
- **Lead with the command.** Developers read docs to do something. Show the command or code first, explain after. If someone can copy-paste and get a result, the doc did its job.
- **One concept per section.** Don't blend installation with configuration with usage. Each section answers one question. Done.
- **Be specific, not vague.** "Runs 200 tests in 3.2 seconds" not "blazing fast." Numbers, file paths, flag names, version numbers. Specificity builds trust.
- **Skip the preamble.** No "In this guide, we'll walk you through..." Just start. The heading already told them what the section is about.
- **Dry humor, not forced humor.** A well-placed aside in a changelog is fine. Jokes in error messages are not. The reader is debugging at 2am — respect that.

## Platform Variations
- **GitHub README**: Starts with a quick install + run example. Badge row for build status, version, downloads. Feature list is scannable bullets, not paragraphs. Links to full docs for depth.
- **Documentation**: Task-oriented. "How to test authenticated endpoints" not "Authentication module reference." Every page has a runnable example. Sidebar navigation mirrors the order a new user would learn.
- **Twitter/X**: Technical hot takes, release announcements with concrete examples, and "how I test X with Pipecheck" mini-threads. Always include a code block or terminal screenshot.
- **Blog**: Deep dives on API testing patterns, post-mortems on bugs Pipecheck caught, and architecture decisions explained. More narrative, still concise paragraphs.
- **Changelog**: Bullet points. Feature name, what it does, one-line example. Link to docs for details. No filler.
- **Error messages**: State what went wrong, where, and what to try. Example: `Error: assertion failed at line 14 of auth-flow.yaml — expected status 200, got 401. Check that AUTH_TOKEN is set in your .env file.`

## Examples

### Example 1 (GitHub README intro)
> Define your API tests in YAML. Run them from the terminal. Ship them in CI. No GUI, no account, no lock-in.
>
> ```bash
> brew install pipecheck
> pipecheck run tests/
> ```

### Example 2 (Twitter release announcement)
> Pipecheck v1.3 just dropped. Snapshot testing for API responses. Capture the shape of your response once, catch unintended contract changes forever. Three lines of YAML. `brew upgrade pipecheck` and try it.

### Example 3 (Changelog entry)
> **v1.3.0 — Snapshot Testing**
> - `snapshot: true` on any request captures the response structure on first run
> - Future runs diff against the snapshot — new/removed fields flagged automatically
> - `pipecheck snapshot update` to accept intentional changes
> - Docs: pipecheck.dev/docs/snapshots

### Example 4 (Error message)
> Error: request timed out after 10s — POST https://api.example.com/users. Increase timeout with `timeout: 30s` in the request block, or check that the target server is reachable.

### Example 5 (Blog intro)
> Last week, a staging deploy broke three downstream services because someone renamed a JSON field from `userId` to `user_id`. The API tests passed because they only checked status codes. Here's how to catch that with snapshot testing in four lines of config.

## Words We Use
- **test suite** (instead of "collection" or "workspace")
- **run** (instead of "execute" or "invoke")
- **config** (instead of "configuration file" or "settings")
- **flag** (instead of "option" or "parameter" when referring to CLI args)
- **assertion** (instead of "check" or "validation")

## Words We Never Use
- **blazing fast** — show the benchmark instead
- **seamless** — nothing is seamless; be specific about the integration
- **robust** — vague and overused; say what makes it reliable
- **out-of-the-box** — describe what actually works without configuration
- **enterprise-grade** — we're an open-source CLI, not an enterprise sales pitch
- **Hello world!** — overused in dev tool docs; use a real example instead

## Signature Patterns
- Code blocks before prose in documentation (show, then explain)
- Changelog entries always include a one-liner example
- Blog posts open with a specific bug or production incident, not an abstract intro
- Terminal output screenshots use a consistent dark theme with cyan accents
- Version numbers always mentioned in release communications
