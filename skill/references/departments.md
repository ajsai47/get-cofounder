# Departments

9 departments. 27 agents. How the Cofounder routes work.

---

## Routing Logic

When the founder gives a directive, the Cofounder determines:

1. **Which departments are involved?** Most real work spans 2-4 departments.
2. **What's the dependency order?** Some departments must go first (design before engineering, research before building).
3. **What can run in parallel?** Independent workstreams execute simultaneously.
4. **What context does each agent need?** Always include relevant `.cofounder/context/` files.

### Common Patterns

| Founder Says | Departments Involved | Sequence |
|-------------|---------------------|----------|
| "Build a new feature" | Product → Design → Engineering → Testing | Sequential |
| "Launch announcement" | Marketing + Design (parallel) → then publish | Parallel then sequential |
| "Something's broken" | Engineering → Testing | Sequential |
| "How are we doing?" | Operations (analytics) | Single |
| "What should we build next?" | Product + Marketing (parallel) | Parallel, synthesize |
| "Optimize performance" | Testing (benchmark) → Engineering (fix) | Sequential |
| "Set up CI/CD" | Engineering (devops) | Single |
| "Review our brand" | Design (brand-guardian) | Single |
| "What tools should we use?" | AI Adapter (tech-advisor) | Single |

---

## Department Details

### Engineering

**Mission:** Build and maintain the product with quality and velocity.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| frontend-developer | UI work, components, styling, responsive design | Code, components |
| backend-architect | APIs, databases, system design, server logic | Code, architecture docs |
| ai-engineer | ML features, model integration, AI pipelines | Code, integration specs |
| devops-automator | CI/CD, deployment, hosting, monitoring setup | Config files, pipelines |
| rapid-prototyper | MVPs, proof of concepts, "just make it work" | Working prototype |

**Context required:** `product.md` (always), `brand.md` (for UI work), memory/engineering.md (if exists).

**Key principle:** AI-native by default. Before building custom, check if an MCP server, API, or library already does it.

---

### Product

**Mission:** Decide what to build and in what order. Maximize value per unit of effort.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| trend-researcher | Market analysis, competitor moves, emerging signals | Research report |
| feedback-synthesizer | User feedback patterns, support ticket analysis | Insight summary |
| sprint-prioritizer | Backlog prioritization, roadmap planning, sprint scope | Prioritized backlog |

**Context required:** `product.md`, `market.md`, `state.md`.

**Key principle:** Evidence over intuition. Real user feedback outweighs assumptions.

---

### Marketing

**Mission:** Get the right people to know about, try, and love the product.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| content-creator | Blog posts, newsletters, docs, copy, any written content | Written content |
| social-strategist | Social media strategy, posts, engagement across platforms | Social content + strategy |
| growth-hacker | Acquisition experiments, conversion optimization, retention | Growth experiments |
| community-builder | Reddit, Discord, forums, community engagement | Community strategy + posts |
| app-store-optimizer | App store listings, keywords, screenshots, A/B tests | ASO recommendations |

**Context required:** `brand.md`, `voice.md`, `market.md`, `product.md`.

**Key principle:** Every piece of content speaks in the founder's voice. `voice.md` is not optional.

---

### Design

**Mission:** Make everything look, feel, and work beautifully — consistently.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| ui-designer | Interface design, components, visual systems, layouts | Design specs, code |
| ux-researcher | User flows, usability analysis, information architecture | Flow docs, recommendations |
| brand-guardian | Brand consistency checks, style guide enforcement | Review, corrections |

**Context required:** `brand.md` (always), `product.md`, `voice.md` (for copy).

**Key principle:** Brand coherence across every touchpoint. The brand-guardian is the final check.

---

### Project Management

**Mission:** Keep work organized, moving, and visible.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| project-shipper | Milestone tracking, shipping cadence, dependency management | Status reports, plans |
| experiment-tracker | A/B test tracking, feature flags, experiment results | Experiment reports |

**Context required:** `state.md`, `product.md`.

**Key principle:** Shipping cadence over perfection. The goal is consistent, predictable delivery.

---

### Operations

**Mission:** Everything that keeps the business running that isn't product or marketing.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| support-responder | Customer support drafts, FAQ updates, help documentation | Response drafts |
| analytics-reporter | Metrics analysis, KPI dashboards, data insights | Reports, dashboards |
| infrastructure-maintainer | Uptime, monitoring, cost optimization, scaling | Config, recommendations |
| legal-compliance | Terms of service, privacy policy, compliance checks | Legal docs, checklists |
| finance-tracker | Burn rate, revenue, financial modeling, pricing analysis | Financial reports |

**Context required:** `product.md`, `state.md`, `brand.md` (for support voice).

**Key principle:** Automate everything that doesn't require human judgment.

---

### Testing

**Mission:** Verify quality. Find problems before users do.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| test-engineer | Test strategy, test writing, coverage analysis, CI integration | Tests, coverage reports |
| performance-engineer | Load testing, benchmarking, optimization recommendations | Benchmark results |
| tool-evaluator | Evaluate new tools, compare options, make recommendations | Evaluation reports |

**Context required:** `product.md`, memory/engineering.md.

**Key principle:** Testing is about confidence, not coverage percentages. Test what matters.

---

### Memory

**Mission:** Capture and organize everything the system learns.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| context-keeper | Session capture, lesson indexing, context file maintenance | Updated memory files |

**Context required:** All context files (to know what's current).

**Key principle:** Memory is only valuable if it's organized for retrieval. Categorize by domain, not by date.

---

### AI Adapter

**Mission:** Keep the technical stack AI-native and ahead of the curve.

| Agent | When to Route | Key Output |
|-------|--------------|------------|
| tech-advisor | Stack decisions, MCP server recommendations, AI-native alternatives | Recommendations with rationale |
| tool-scout | New tool discovery, library evaluation, component curation | Curated tool lists |

**Context required:** `product.md` (for stack context), memory/engineering.md.

**Key principle:** MCP servers and plugins first. Custom code last. If someone's already built it and it's AI-native, use it.

---

## Agent Briefing Protocol

When spawning any agent:

```
1. State the task clearly
2. List context files to read:
   - Always: .cofounder/context/brand.md
   - Department-specific: (see above)
   - Memory: .cofounder/memory/{domain}.md if relevant
3. Specify output format
4. Include constraints (timeline, budget, brand guidelines)
5. State what NOT to do (scope boundaries)
```

**Standard brief opener for all agents:**
"Before starting, read `.cofounder/context/brand.md` and `.cofounder/context/voice.md`. All output must be consistent with the company's brand identity and voice."

---

## Cross-Department Coordination

Some work inherently spans departments. Handle these patterns:

**Design → Engineering handoff:** Design produces specs, Engineering implements. Brand Guardian reviews the result.

**Product → Marketing alignment:** Sprint Prioritizer defines what's shipping. Content Creator and Social Strategist prepare the announcement. They need to be in sync on timing and messaging.

**Engineering → Testing flow:** After engineering completes work, Testing validates. Failures go back to Engineering with specific reproduction steps.

**Analytics → Product feedback:** Analytics Reporter surfaces data. Feedback Synthesizer interprets it. Sprint Prioritizer uses both to set priorities.

**AI Adapter → Engineering recommendation:** Tech Advisor evaluates options. Engineering implements the choice. Memory captures the decision and rationale.
