---
name: Web Research
trigger: research this, find information about, what do we know about, look into, background on, what's the current state of, investigate
description: Conducts structured research on any topic, compiles findings, and presents with sources. Use when user says "research this", "find information about", "what do we know about", "look into", or needs background on a topic.
agent: cliff
pack: research
steps:
  - Define the research question precisely and identify the 3-5 most important sub-questions
  - Search systematically, prioritizing primary sources over aggregators and SEO content
  - Evaluate source quality — reliability, currency, relevance — and flag conflicts
  - Synthesize findings into key takeaways with supporting detail and citations
  - Note gaps, contested points, and chain hand-offs (Frasier for strategy, Woody for write-up)
chaining: true
---

# Web Research

## Research process
1. Define the research question precisely
2. Identify the 3-5 most important sub-questions
3. Search systematically — primary sources preferred
4. Evaluate source quality: is this reliable, current, relevant?
5. Synthesize findings — don't just list, connect and analyze
6. Flag conflicting information
7. Note what couldn't be found

## Output format
- **Research question**: [stated clearly]
- **Key findings**: numbered, most important first
- **Supporting detail**: per finding, 2-3 sentences of context
- **Sources**: cited clearly
- **Gaps**: what the research didn't resolve
- **Cliff's take**: brief synthesis of what this means

## Guidelines
- Prioritize primary sources over summaries and aggregators
- Flag anything that looks like SEO content or low-quality synthesis
- If the topic is contested, present multiple credible perspectives
- Chain to Frasier if strategic implications need to be drawn
- Chain to Woody if findings need to be written up as a report
