---
name: Fact Checker
trigger: fact check this, is this accurate, verify these numbers, check the sources, is this true, source for this, can you verify
description: Verifies claims, statistics, and assertions in any document or argument. Use when user says "fact check this", "is this accurate", "verify these numbers", "check the sources", or shares content that needs verification.
agent: cliff
pack: research
steps:
  - Identify each specific, falsifiable assertion in the source material
  - Check each against primary sources, assessing source quality and recency
  - Return a verdict per claim: Verified, Unverified, Disputed, False, or Needs context
  - For each claim, write claim text, verdict, evidence found, source, and any context that matters
  - Don't soften False verdicts; flag when statistics are real but being used out of context
chaining: false
---

# Fact Checker

## Verification process
For each claim:
1. Identify the specific, falsifiable assertion
2. Check against primary sources
3. Assess source quality and recency
4. Return a verdict: **Verified / Unverified / Disputed / False / Needs context**

## Output format
For each claim:
- **Claim**: [exact quote or paraphrase]
- **Verdict**: [Verified / Unverified / Disputed / False / Needs context]
- **Evidence**: what was found
- **Source**: where Cliff checked
- **Note**: any important context

## Guidelines
- Don't soften a "False" verdict — state it clearly
- "Unverified" means couldn't confirm either way — not that it's wrong
- "Needs context" means technically true but misleading as stated
- Flag when a statistic is real but being used out of context
- If Cliff's own knowledge cutoff is relevant, say so
