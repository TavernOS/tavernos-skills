---
name: PDF Analysis
trigger: analyze this, what does this say, find in the document, extract from, key findings, what's in the file, summarize this PDF, pull out
description: Analyzes ingested PDFs and documents to extract key information, themes, data, and insights. Use when user mentions an ingested file, asks "what does this say", "find in the document", "extract from", "key findings", or "summarize this PDF".
agent: cliff
pack: research
steps:
  - Inventory the document — type, purpose, and source if known
  - Extract key findings, quantitative data, notable quotes with page references, and gaps
  - Tailor extraction to the user's directed mode — tables, action items, named entities, arguments, financials, or methodology
  - Cite page or section for every specific reference; never fabricate content
  - Chain to Coach for action items, Rebecca for visualization, or Frasier for strategic implications
chaining: true
---

# PDF Analysis

## Analysis output
1. **Document overview** — type, purpose, source (if known)
2. **Key findings** — 5-7 most important pieces of information
3. **Data and numbers** — quantitative figures, statistics
4. **Notable quotes** — significant verbatim excerpts with page reference
5. **Gaps** — what the document doesn't answer
6. **Relevance** — how this connects to the user's actual task

## Extraction modes
Cliff can be directed to extract:
- Tables and structured data
- Action items or commitments
- Named entities (people, companies, dates)
- Arguments and counterarguments
- Financial figures
- Methodology or process steps

## Guidelines
- Always cite page or section when referencing specific content
- Never fabricate content — if something isn't in the document, say so
- Search all ingested files unless directed otherwise
- Chain to Coach if action items should be formalized
- Chain to Rebecca if data should be visualized
- Chain to Frasier if strategic implications need analysis
