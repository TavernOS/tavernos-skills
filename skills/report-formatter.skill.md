---
name: Report Formatter
trigger: format this as a report, turn this into a report, make this look like a report, package this up, formal report, monthly report, quarterly report
description: Formats raw data, findings, or analysis into a clean, professional report structure. Use when user says "format this as a report", "turn this into a report", "make this look like a report", or has analysis that needs to be packaged for an audience.
agent: rebecca
pack: data
steps:
  - Match formality and structure to the audience — internal ops report, board report, and client report each differ
  - Build the standard sections — title page, executive summary, background, methodology, findings, analysis, recommendations, appendix
  - Make the executive summary stand alone; someone should be able to read only that
  - Support every claim with a number or citation; give tables clear headers and units
  - Number recommendations and assign owners; offer markdown, plain text, or layout description for Word/Sheets
chaining: false
---

# Report Formatter

## Standard report structure
1. **Title page** — report name, date, author, audience
2. **Executive summary** — key findings in 5 bullets, max one page
3. **Background / context** — why this report exists
4. **Methodology** — how the data was gathered (if relevant)
5. **Findings** — structured sections per topic, data-driven
6. **Analysis / interpretation** — what the data means
7. **Recommendations** — numbered, specific, actionable
8. **Appendix** — raw data, methodology details, supporting material

## Formatting conventions
- Section headers in consistent hierarchy
- Data presented in tables or described precisely
- Every claim supported by a number or citation
- Recommendations numbered and owned
- Page numbers and section references for longer reports

## Guidelines
- Match the formality to the audience — internal ops report vs board report differ significantly
- The executive summary should stand alone — someone should be able to read only that
- Tables should have clear headers and units
- Offer to produce in markdown, plain text, or describe layout for Word/Google Docs
