---
description: "Ship to production — full cross-department readiness checks and launch coordination"
argument-hint: "[feature-name]"
allowed-tools: ["Read", "Write", "Edit", "Glob", "Grep", "Bash", "Agent"]
model: opus
---

> **Auto-loaded context:** Read `.cofounder/context/product.md`, `.cofounder/context/state.md`, and `.cofounder/context/brand.md` before proceeding.

# /launch — Ship to Production

Coordinate a launch across all departments. Not just deploying code — the full launch: product ready, marketing queued, support prepared, monitoring live.

---

## Trigger

User invokes `/launch` or says "let's ship this" / "ready to launch" / "deploy the feature."

---

## Process

### 1. Pre-Launch Audit

Run departments in parallel to assess readiness:

**Engineering (spawn: devops-automator + test-engineer)**
- [ ] All tests passing in CI
- [ ] No critical or high-severity bugs open
- [ ] Performance benchmarks within budget
- [ ] Environment variables configured for production
- [ ] Database migrations ready and tested
- [ ] Rollback plan documented
- [ ] Monitoring and alerting configured

**Design (spawn: brand-guardian)**
- [ ] UI matches brand guidelines
- [ ] Responsive design verified
- [ ] Accessibility checks passed
- [ ] Loading states, error states, empty states all handled
- [ ] Visual consistency review passed

**Marketing (spawn: content-creator + social-strategist)**
- [ ] Launch announcement drafted
- [ ] Social posts queued for each platform
- [ ] Blog post / changelog ready
- [ ] Email to existing users drafted (if applicable)
- [ ] Landing page updated with new feature

**Operations (spawn: support-responder + analytics-reporter)**
- [ ] FAQ updated for the new feature
- [ ] Support team briefed on expected questions
- [ ] Analytics tracking in place for new feature
- [ ] Success metrics defined and dashboards ready

### 2. Readiness Report

Present all findings to the founder:

```markdown
# Launch Readiness: {feature/product}

## Status: {GO | HOLD | NO-GO}

## Engineering: {Ready | Issues Found}
- {checklist status with any blockers}

## Design: {Ready | Issues Found}
- {checklist status}

## Marketing: {Ready | Issues Found}
- {content ready status}

## Operations: {Ready | Issues Found}
- {support and analytics status}

## Blockers
- {anything that must be resolved before launch}

## Risks
- {known risks and mitigations}

## Recommendation
{GO with confidence / GO with caveats / HOLD until X is resolved}
```

### 3. Launch Sequence

After founder gives the go:

```
T-60min  Final CI run, verify staging
T-30min  Marketing content finalized, social posts scheduled
T-15min  Deploy to production
T-0      Verify deployment, smoke test core flows
T+5min   Marketing goes live (announcement, social, email)
T+15min  Monitor error rates, performance, user feedback
T+1hr    First metrics check
T+24hr   Launch retrospective
```

### 4. Post-Launch

- Monitor metrics against success criteria
- Capture user feedback (route to feedback-synthesizer)
- Respond to support inquiries (route to support-responder)
- Update `.cofounder/context/state.md` with what shipped
- Update `.cofounder/context/product.md` with new features
- Feed memory with launch learnings

---

## Launch Types

**Feature launch (small):**
- Skip marketing audit if internal-only
- Simplified checklist
- Deploy and monitor

**Product launch (large):**
- Full multi-department audit
- Coordinated marketing campaign
- Support team preparation
- Phased rollout recommended

**Hotfix (urgent):**
- Engineering-only audit
- Minimal marketing (changelog entry)
- Fast-track deployment
- Post-deploy verification emphasis

---

## Anti-Patterns

- **Launching on Friday.** Don't. If it breaks, you ruin your weekend.
- **Skipping the readiness check.** "It works on my machine" is not a launch plan.
- **Marketing before engineering is ready.** Nothing worse than announcing a feature that's broken.
- **No rollback plan.** Every launch must be reversible.
- **No monitoring.** If you can't see it breaking, you'll hear about it from users. That's too late.
