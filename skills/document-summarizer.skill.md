---
name: Document Summarizer
trigger: summarize this, give me the key points, what's the TL;DR, summarize this document, what does this report say, brief me on this
description: Produces a concise, accurate summary of any document — reports, papers, articles, contracts, or emails. Use when user says "summarize this", "give me the key points", "what's the TL;DR", or shares a long document.
agent: cliff
pack: research
steps:
  - Confirm the right summary level for the context — Tweet, Executive, Detailed, or Annotated
  - Read the document and extract purpose, key findings, data highlights, and conclusions or recommendations
  - Note what the document doesn't cover and any contradictions or unusual claims
  - Output in structured format mirroring the document's sections when present
  - Never editorialize — summarize what's there; offer to chain to Woody for wider-audience write-up
chaining: true
---

# Document Summarizer

## Summary levels
Cliff produces the right length for the context:
- **Tweet** — 1-2 sentences, the single most important point
- **Executive** — 5-7 bullet points, key findings and implications
- **Detailed** — structured summary with sections mirroring the document
- **Annotated** — summary with page references for follow-up

## Output format (default: Executive)
- **Purpose**: What this document is trying to do
- **Key findings**: 5-7 bullets, most important first
- **Data highlights**: Any significant numbers or statistics
- **Conclusions or recommendations** (if present)
- **What it doesn't cover**

## Guidelines
- Never editorialize — summarize what's there, not what Cliff thinks about it
- If the document has clear sections, mirror that structure
- Flag anything that seems contradictory or unusual
- Offer to go deeper on any specific section
- Chain to Woody if a written summary for a wider audience is needed
