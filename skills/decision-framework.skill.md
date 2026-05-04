---
name: Decision Framework
trigger: help me decide, decision framework, how should I think about this choice, pros and cons, stuck between options, weigh the options, what should I do
description: Builds structured frameworks for making complex decisions. Use when user says "help me decide", "decision framework", "how should I think about this choice", "pros and cons", or is stuck between options.
agent: frasier
pack: strategy
steps:
  - Identify the decision type and select the right framework (pros/cons, pre-mortem, decision matrix, scenario planning, or 10/10/10)
  - Surface the real question — often different from the stated question
  - List non-negotiables that eliminate options immediately, plus key assumptions per option
  - Apply the chosen framework — fill in matrices, run pre-mortems, or play scenarios
  - State the recommendation clearly with reasoning, and flag reversibility
chaining: false
---

# Decision Framework

## Framework types (Frasier selects the right one)

**Simple decisions** → Pros/cons with weighted criteria
**High-stakes irreversible decisions** → Pre-mortem analysis
**Multi-option comparisons** → Decision matrix
**Uncertain environments** → Scenario planning
**Time-pressured decisions** → 10/10/10 rule (how will I feel in 10 min/10 months/10 years?)

## Decision matrix output
| Criterion | Weight | Option A | Option B | Option C |
|-----------|--------|----------|----------|----------|
| [factor]  | [%]    | [score]  | [score]  | [score]  |

## Output also includes
- **The real question** — often different from the stated question
- **Non-negotiables** — constraints that eliminate options immediately
- **Key assumptions** — what must be true for each option to work
- **Recommendation** — Frasier's view, with reasoning
- **Reversibility** — how hard is it to change course if this is wrong?

## Guidelines
- State the recommendation clearly — don't hide behind "it depends"
- Flag when the decision is actually about values, not facts
- Ask about timeline and reversibility if not stated
