# Memory Scopes

How memory is organized across three scopes so learnings end up in the right place and follow the right people.

---

## Why Memory Scopes Matter

A single flat memory directory conflates three different kinds of knowledge:

- **Personal patterns** — a content-creator's voice learnings should follow them across projects. A backend-architect's preferred database patterns travel with the person, not the codebase.
- **Project-specific knowledge** — architecture decisions, codebase conventions, product learnings. These belong to the project and should be shared with anyone working on it.
- **Private and temporary notes** — WIP thoughts, sensitive credentials context, personal opinions that should not be committed to git or shared with collaborators.

Without scopes, everything lands in `.cofounder/memory/` and you get voice patterns committed alongside architecture decisions alongside personal notes. Scopes fix this.

---

## Three Memory Scopes

| Scope | Location | Persists Across | Committed to Git | Use For |
|-------|----------|----------------|-----------------|---------|
| User | `~/.claude/cofounder-memory/` | All projects | No | Voice patterns, personal preferences, cross-project learnings |
| Project | `.cofounder/memory/` | Sessions in this project | Yes (optional) | Architecture decisions, codebase patterns, product learnings |
| Local | `.cofounder/memory-local/` | Sessions in this project | No (.gitignored) | Personal notes, WIP learnings, sensitive info |

### User Scope

Global knowledge that belongs to the person, not the project. Stored in the home directory so it is available regardless of which project is active.

**Examples:**
- "I prefer Drizzle over Prisma for new projects"
- "My writing voice is direct, slightly irreverent, uses short sentences"
- "Always set up Biome before first commit"
- "I like dark mode defaults in dashboards"

### Project Scope

Knowledge that belongs to this specific codebase or product. Anyone working on the project benefits from it. This is the existing `.cofounder/memory/` directory — it does not move.

**Examples:**
- "This project uses Neon with connection pooling via @neondatabase/serverless"
- "Users abandon onboarding at step 3 — the skip option increased completion to 71%"
- "Stripe webhook signature verification is required — connection fails silently without it"
- "Twitter threads get 3-4x engagement vs single tweets for this brand"

### Local Scope

Personal, sensitive, or temporary knowledge that should never be committed. Git-ignored by default.

**Examples:**
- "I think the pricing page needs a complete rewrite but haven't discussed it yet"
- "My local dev environment uses port 3001 because 3000 conflicts with another service"
- "Debugging notes: the auth bug was in the middleware, not the route handler"
- "Credentials context: the Stripe test key rotates monthly"

---

## Memory Scope by Department

| Department | User Scope | Project Scope | Local Scope |
|-----------|-----------|--------------|------------|
| Engineering | Stack preferences, coding style, tool choices | Architecture decisions, codebase patterns, API quirks | Personal debugging notes, local env config |
| Marketing | Voice patterns, writing style, content preferences | Campaign results, content performance, channel learnings | Draft ideas, personal contacts, content experiments |
| Design | Design preferences, tool configs, aesthetic leanings | Brand decisions, component patterns, user research | Sketch ideas, personal aesthetic notes, mood boards |
| Product | Prioritization frameworks, review standards | User feedback patterns, roadmap history, metric baselines | Personal product opinions, unshared hypotheses |
| Operations | Tool preferences, workflow habits | Operational procedures, runbook learnings, vendor evaluations | Cost info, credentials context, personal process notes |
| Validation | Review standards, quality bar preferences | Project-specific quality patterns, test coverage rules | -- |

---

## How Scopes Interact

### Retrieval Order

When an agent starts work, it reads scopes in this order:

1. **User scope** first — establishes the person's baseline preferences and patterns
2. **Project scope** second — layers on project-specific knowledge
3. **Local scope** last — applies any personal overrides or notes

### Conflict Resolution

When user and project scopes disagree, **project scope wins for this project**. The rationale: project-specific patterns were established for a reason. Your personal preference for Prisma does not override this project's commitment to Drizzle.

When local scope contradicts project scope, local scope is treated as a personal note, not an override. Agents should follow project scope for shared decisions and note the local scope disagreement for the user's awareness.

### Default Scope for Saving

When saving a new learning, the default scope is **project** unless:
- The learning is explicitly personal or cross-project (save to user)
- The learning is sensitive, temporary, or WIP (save to local)

---

## Memory Scope Decision Tree

Use this to classify where a learning belongs:

```
Is this learning specific to this codebase or product?
├── Yes → Project scope (.cofounder/memory/)
└── No →
    Would this be useful in a different project?
    ├── Yes → User scope (~/.claude/cofounder-memory/)
    └── No →
        Is this personal, sensitive, or temporary?
        ├── Yes → Local scope (.cofounder/memory-local/)
        └── Not sure → Project scope (safe default)
```

**Quick test:**
- "Would this be useful in a different project?" — User scope
- "Is this specific to this codebase/product?" — Project scope
- "Is this personal/sensitive/temporary?" — Local scope
- "Not sure?" — Project scope (safe default)

---

## Directory Structure

```
# User scope (global, not committed)
~/.claude/cofounder-memory/
├── index.md              <- global lesson index
├── voice-patterns.md     <- writing style across projects
├── tool-preferences.md   <- preferred tools and configs
├── engineering-style.md  <- coding patterns and preferences
└── {domain}.md           <- other global learnings

# Project scope (project-specific, optionally committed)
.cofounder/memory/
├── index.md              <- project lesson index
├── engineering.md        <- codebase-specific patterns
├── product.md            <- product-specific learnings
├── marketing.md          <- campaign results
└── {domain}.md           <- other project learnings

# Local scope (personal, never committed)
.cofounder/memory-local/
├── notes.md              <- personal WIP notes
├── preferences.md        <- personal preferences
└── {anything}.md         <- sensitive or temporary info
```

---

## Gitignore Pattern

Add to `.gitignore` at the project root:

```
# Local memory scope — personal, never committed
.cofounder/memory-local/
```

The user scope (`~/.claude/cofounder-memory/`) lives outside the project directory and is never in any git repo. The project scope (`.cofounder/memory/`) is committed or not at the team's discretion.

---

## Memory Lifecycle

1. **Capture** — an agent identifies a learning worth remembering during a session.
2. **Classify** — use the decision tree to determine which scope the learning belongs in.
3. **Store** — save to the appropriate scope directory, in the right domain file.
4. **Index** — update that scope's `index.md` with a one-line summary.
5. **Retrieve** — on session start, agents read relevant scopes in order (user, project, local).
6. **Prune** — the context-keeper periodically reviews all three scopes for staleness, duplicates, and misplaced entries.

---

## Scope Migration

Learnings sometimes start in one scope and belong in another. Common migrations:

| From | To | When |
|------|-----|------|
| Project | User | A project-specific pattern proves useful across 3+ projects. It has graduated to a personal best practice. |
| Local | Project | A personal note turns out to be a real project pattern that the team should know. |
| User | Project | A personal preference becomes a project decision (e.g., "I prefer Drizzle" becomes "This project uses Drizzle because..."). |
| Project | Local | A learning turns out to be personal opinion, not a project pattern. Move it before it misleads other agents. |

**Migration process:**
1. Copy the entry to the destination scope
2. Adapt the wording (personal preferences become project decisions, or vice versa)
3. Remove the entry from the source scope
4. Update both scope indexes

---

## Scope Health Signals

Signs that learnings are in the wrong scope:

- **User scope has project-specific entries** — mentions codebase files, specific APIs, project-only tools. These should be in project scope.
- **Project scope has personal preferences** — "I like..." or "I prefer..." language. Move to user or local scope.
- **Local scope has valuable patterns** — learnings that would help any collaborator but are hidden in local. Promote to project scope.
- **Project scope has sensitive info** — API keys, personal contacts, credentials context. Move to local scope immediately.
- **User scope is empty** — after months of work, nothing has been promoted to cross-project knowledge. Review project scopes for promotion candidates.
