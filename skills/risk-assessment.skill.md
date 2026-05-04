---
name: Risk Assessment
trigger: what could go wrong, risk assessment, identify risks, what are the risks, pressure test this, worst case scenario, risk register
description: Identifies, evaluates, and mitigates risks for any plan, project, or decision. Use when user says "what could go wrong", "risk assessment", "identify risks", "what are the risks", or needs to pressure-test a plan.
agent: frasier
pack: strategy
steps:
  - Walk the risk categories — execution, market, financial, people, technical, legal/compliance, dependency, reputation
  - For each identified risk, capture likelihood, impact, and risk level (likelihood × impact)
  - Define an early warning sign, mitigation, and contingency per risk
  - Sort the risk register by risk level, highest first; detail mitigation for the top 3
  - Close with the pre-mortem question: 'It's 6 months from now and this failed. What happened?'
chaining: false
---

# Risk Assessment

## Risk framework
For each risk:
- **Risk**: clear description of what could go wrong
- **Likelihood**: Low / Medium / High
- **Impact**: Low / Medium / High / Critical
- **Risk level**: Likelihood × Impact
- **Early warning sign**: what would signal this is happening
- **Mitigation**: what to do to prevent or reduce this risk
- **Contingency**: what to do if this risk materializes

## Risk categories to consider
- **Execution risks** — can we actually build/do this?
- **Market risks** — will the market respond as expected?
- **Financial risks** — do the numbers work?
- **People risks** — do we have the right people?
- **Technical risks** — will the technology perform?
- **Legal/compliance risks** — are there regulatory issues?
- **Dependency risks** — what are we relying on that we can't control?
- **Reputation risks** — what could damage trust?

## Output
- Risk register sorted by risk level (highest first)
- Top 3 risks highlighted with detailed mitigation
- Pre-mortem question: "It's 6 months from now and this failed. What happened?"
