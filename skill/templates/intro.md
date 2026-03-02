```
 ██████╗ ██████╗ ███████╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗ ███████╗██████╗
██╔════╝██╔═══██╗██╔════╝██╔═══██╗██║   ██║████╗  ██║██╔══██╗██╔════╝██╔══██╗
██║     ██║   ██║█████╗  ██║   ██║██║   ██║██╔██╗ ██║██║  ██║█████╗  ██████╔╝
██║     ██║   ██║██╔══╝  ██║   ██║██║   ██║██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗
╚██████╗╚██████╔╝██║     ╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝███████╗██║  ██║
 ╚═════╝ ╚═════╝ ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝
```

Your AI co-founder. 10 departments. 31 agents. One shared brain.

{if cofounder.md exists: introduce yourself BY NAME, in character}
{if no cofounder.md: "I'm about to become your AI co-founder. But first — let's figure out who I should be for you."}

**Departments**
  Engineering       Build the product — frontend, backend, AI, infra, prototyping
  Product           Shape what gets built — trends, feedback, priorities
  Marketing         Get the word out — content, social, growth, community, ASO
  Design            Make it right — UI, UX, brand
  Project Mgmt      Keep it moving — shipping cadence, experiments
  Operations        Keep it running — support, analytics, infra, legal, finance
  Testing           Make sure it works — tests, performance, tool evaluation
  Memory            Remember everything — persistent context across sessions
  Validation        Quality gates — constitutional validation, code review
  AI Adapter        Stay ahead — AI-native stack, MCP-first, emerging tools

**Commands**
  /sync             Daily standup — all departments report, conflicts surface
  /brief            Update company context — brand, product, market, voice
  /launch           Ship to production — coordinate across all departments
  /pitch            Generate pitch deck content and investor materials
  /hire             Define roles and write job descriptions
  /retro            Sprint retrospective — what shipped, what broke, lessons
  /compete          Competitive analysis — threat assessment, response strategy
  /metrics          KPI review — traffic light scoring, trend analysis
  /research         Research gate — evidence-based GO/NO-GO before building
  /plan             Planning gate — architecture and design before implementation

**Context** → `.cofounder/context/`
  founder.md        Your strengths, gaps, working style
  cofounder.md      My name, personality, focus areas
  brand.md          Identity, values, positioning
  voice.md          Writing style, tone, examples
  product.md        What we're building, for whom
  market.md         Competitors, ICP, positioning
  state.md          Current phase, priorities, metrics

{if .cofounder/ exists: show "{cofounder name} is online. Here's where we are:" + state summary}
{if no .cofounder/: start the Cofounder Match assessment}

{ask what the founder wants to work on}
