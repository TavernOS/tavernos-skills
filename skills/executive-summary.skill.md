---
name: Executive Summary
trigger: executive summary, summarize for leadership, one-pager, TL;DR for executives, summary for the board, key points up front
description: Writes executive summaries for reports, proposals, research, or any long document. Use when user says "executive summary", "summarize for leadership", "one-pager", "TL;DR for executives", or needs the key points pulled up front.
agent: woody
pack: content
steps:
  - Read the full source document and extract the conclusion and supporting evidence
  - Write Situation → Complication → Resolution → Ask, leading with the conclusion
  - Keep total length to one page / 400 words max; remove any sentence that doesn't earn its place
  - Hold to 3 bullets of supporting evidence; state the ask plainly (decision, approval, funding, attention)
  - Close with 1-2 clear next-step actions; offer a longer version if needed
chaining: false
---

# Executive Summary

## Executive summary rules
- Maximum length: one page / 400 words
- No jargon the reader hasn't defined
- Lead with the conclusion, not the background
- Structure: Situation → Complication → Resolution → Ask

## Output format
1. **What this is** — one sentence
2. **The situation** — current state, why this matters now
3. **The finding or recommendation** — the main point
4. **Supporting evidence** — 3 bullet points maximum
5. **What we're asking for** — decision, approval, funding, attention
6. **Next steps** — 1-2 clear actions

## Guidelines
- Write for someone who will read this in 90 seconds
- Every sentence must earn its place — cut anything decorative
- If the full document is provided, Woody reads it and extracts; don't ask the user to summarize first
- Offer to write a longer version if needed
