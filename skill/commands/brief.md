---
description: "Update company context — brand, product, market, voice, or state changes"
argument-hint: "[brand|voice|product|market|state]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "WebSearch", "WebFetch", "Agent"]
model: sonnet
---

> **Auto-loaded context:** Read the context file specified by the argument (e.g., `.cofounder/context/brand.md` for `/brief brand`).

# /brief — Update Company Context

Update the shared brain. When the company evolves, the context files must keep up.

---

## Trigger

User invokes `/brief` or describes a change to brand, product, market, voice, or status.

---

## Process

### 1. Understand the Change

Ask the founder what changed. Common triggers:
- "We're pivoting to..." → product.md, market.md, possibly brand.md
- "Our voice should be more..." → voice.md
- "New competitor appeared" → market.md
- "We shipped X" → product.md, state.md
- "Our priorities changed" → state.md
- "We're rebranding" → brand.md, voice.md

### 2. Identify Affected Files

Map the change to context files:

| Change Type | Files Affected |
|------------|---------------|
| Brand/identity shift | brand.md, possibly voice.md |
| Voice/tone change | voice.md |
| Product change | product.md, state.md |
| Market shift | market.md |
| Priority change | state.md |
| Major pivot | potentially all files |

### 3. Read Current Context

Read the affected files to understand current state before modifying.

### 4. Draft Updates

Show the founder what will change:
- Current version (relevant section)
- Proposed update
- Rationale

### 5. Apply Updates

After founder approval:
- Update the context files
- Note which agents are affected by the change
- Feed memory if the change represents a lesson learned

### 6. Downstream Impact

Tell the founder:
"This change affects {list of agents/departments}. Their next output will reflect the updated context. If there's in-flight work from these departments, it may need revision."

---

## Voice Extraction Pipeline

Deep protocol for capturing the founder's authentic voice from their social content.

### Method 1: Twitter/X Feed Analysis

If the founder shares their Twitter handle:

1. **Fetch recent tweets** — Use Composio Twitter integration or ask founder to paste their last 20-30 tweets
2. **Analyze structural patterns:**
   - Average sentence length (short and punchy? or longer and flowing?)
   - Paragraph structure (one-liners? or multi-sentence blocks?)
   - Thread style (numbered? narrative? question-driven?)
   - Use of punctuation (em dashes? ellipses? minimal punctuation?)
   - Emoji usage (none? strategic? frequent?)
3. **Analyze vocabulary patterns:**
   - Technical depth (jargon level, assumed knowledge)
   - Power words they gravitate toward
   - Filler words they avoid
   - How they start sentences (action verbs? "I"? declarative statements?)
   - How they handle disagreement (direct? diplomatic? humorous?)
4. **Analyze personality markers:**
   - Humor style (dry? playful? none?)
   - Confidence level (assertive? hedging? mix?)
   - Engagement style (asks questions? makes statements? shares stories?)
   - Hot take frequency and style
5. **Extract and compile** into voice.md:
   - Tone: 3-5 adjectives with evidence from tweets
   - Principles: rules that explain the patterns
   - Examples: 5 best tweets that exemplify the voice
   - Words: vocabulary analysis → use/avoid lists
   - Signatures: recurring patterns → signature section

### Method 2: Writing Samples

If the founder pastes blog posts, emails, or other writing:

1. **Analyze 3+ samples** of different types (ideally one casual, one technical, one persuasive)
2. **Compare patterns** across samples to find the constants (voice) vs. variables (platform adaptation)
3. **Same analysis framework** as Twitter but adapted for long-form

### Method 3: Conversational Extraction

If the founder has no writing samples:

Ask these questions and capture their natural writing style in the responses:
1. "How would you explain your product to a developer friend over coffee?"
2. "What's the most controversial opinion you have about your industry?"
3. "Write a quick tweet announcing your favorite feature."
4. "How would you respond to a frustrated user?"
5. "What advice would you give someone starting what you're building?"

Their answers ARE the voice samples. Extract patterns from how they naturally communicate.

### Validation

After extracting, show the founder:
1. "Here's how I'd describe your voice: {tone descriptors}"
2. "Here's a sample tweet I'd write as you: {generated example}"
3. "Here's a sample email opener: {generated example}"
4. "Does this sound like you? What's off?"

Iterate until they say "yes, that's me." The voice.md is only as good as the founder's confirmation.

### Ongoing Voice Refinement

Voice isn't static. Periodically (every 4-6 weeks or when content performance shifts):
1. Re-analyze recent content for voice drift
2. Check which content performed best — does the voice file match the high-performers?
3. Update voice.md with refined patterns
4. Note the evolution in memory (voice is a living document)

---

## Context File Formats

When creating or updating, maintain these structures:

### brand.md
```markdown
# Brand

## Identity
- **Name**: {company name}
- **Tagline**: {one line}
- **Mission**: {one sentence}

## Values
- **{Value 1}**: {what it means in practice}
- **{Value 2}**: {what it means in practice}
- **{Value 3}**: {what it means in practice}

## Personality
{2-3 sentences describing how the brand acts and feels}

## Visual Identity
- **Primary colors**: {hex codes}
- **Typography**: {font choices}
- **Imagery**: {style guidelines}

## Positioning
For {target audience}, {product} is the {category} that {key benefit}, unlike {alternatives} which {limitation}.
```

### voice.md
```markdown
# Voice

## Tone
{3-5 adjective descriptors, e.g., "direct, warm, slightly irreverent, technical but accessible"}

## Principles
- {principle 1, e.g., "Short sentences. Punch, don't meander."}
- {principle 2}
- {principle 3}

## Platform Variations
- **Twitter/X**: {how voice adapts for Twitter}
- **Blog/Newsletter**: {how voice adapts for long-form}
- **Documentation**: {how voice adapts for docs}
- **Product UI**: {how voice adapts for UI copy}

## Examples
{3-5 real writing samples from the founder}

## Words We Use
{list of preferred terms}

## Words We Avoid
{list of terms to never use}
```

### product.md
```markdown
# Product

## Overview
- **Name**: {product name}
- **One-liner**: {what it does in one sentence}
- **Problem**: {what pain it solves}

## Target User
{who they are, what they care about, where they hang out}

## Core Features
- {feature 1}: {brief description}
- {feature 2}: {brief description}

## Technical Stack
- **Frontend**: {framework, language}
- **Backend**: {framework, language}
- **Database**: {what and where}
- **Infrastructure**: {hosting, CI/CD}
- **Key integrations**: {APIs, MCP servers, services}

## Roadmap
1. {next milestone}
2. {following milestone}
3. {future milestone}

## Key Metrics
- {metric 1}: {current value}
- {metric 2}: {current value}
```

### market.md
```markdown
# Market

## Category
{what space we're in}

## Competitors
| Name | Positioning | Strength | Weakness |
|------|------------|----------|----------|
| {competitor} | {how they position} | {what they do well} | {where they fall short} |

## Our Differentiation
{why us over them — 2-3 sentences}

## ICP (Ideal Customer Profile)
- **Demographics**: {who}
- **Psychographics**: {what they value}
- **Behaviors**: {what they do, where they hang out}
- **Pain points**: {what frustrates them}

## Distribution Channels
- {channel 1}: {why it works for our ICP}
- {channel 2}: {why it works for our ICP}

## Trends
- {trend 1}: {how it affects us}
- {trend 2}: {how it affects us}
```

### state.md
```markdown
# State

**Phase**: {pre-launch | beta | growth | scaling}
**Updated**: {date}

## Priorities
1. {top priority}
2. {second priority}
3. {third priority}

## Metrics
- {metric}: {value} ({trend: up/down/flat})

## Active Work
- {workstream 1}: {status}
- {workstream 2}: {status}

## Blockers
- {blocker}: {what would unblock it}

## Recent Wins
- {what shipped or landed recently}
```
