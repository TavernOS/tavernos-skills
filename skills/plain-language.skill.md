---
name: Plain Language
trigger: explain this simply, translate this, make this readable, dumb this down, plain English, what does this mean, simplify
description: Rewrites complex, technical, or jargon-heavy text in plain English. Use when user says "explain this simply", "translate this", "make this readable", "dumb this down", or shares something that's hard to understand.
agent: norm
pack: core
steps:
  - Read the original to identify jargon, long sentences, passive constructions, and buried main points
  - Rewrite using the principles — plain equivalents for jargon, sentences under 20 words, active voice, main point first
  - Preserve all meaning and important nuance; simplify the language, not the substance
  - Provide the rewritten version first, followed by a one-line note on what was changed and why
  - Offer to adjust reading level (executive / general public / technical) if the result lands wrong
chaining: false
---

# Plain Language

## What this skill does
Rewrites complex content so that a smart non-expert can read and act on it.

## Rewriting principles
- Replace jargon with plain equivalents
- Break long sentences into shorter ones (target: under 20 words each)
- Use active voice
- Lead with the main point, not the context
- Use examples where abstraction is unavoidable
- Preserve all meaning — simplify the language, not the substance

## Output
- Rewritten version first
- Then a one-line note on what was changed and why
- Offer to adjust reading level if needed (executive / general public / technical)

## Guidelines
- Never remove important nuance in the name of simplicity
- If something genuinely can't be simplified, explain why
