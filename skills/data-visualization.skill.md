---
name: Data Visualization
trigger: chart, graph, visualize, plot this, show me a, what kind of chart, data viz, make a graph
description: Recommends and describes the right chart or visualization for any dataset and produces structured data to build it. Use when user mentions "chart", "graph", "visualize", "plot this data", or pastes raw numbers.
agent: rebecca
pack: data
steps:
  - Identify the question the chart needs to answer and pick the right type from the selection guide
  - Build a chart spec — type, insight-stating title, axis labels with units, design call-outs
  - Provide a ready-to-paste data table for Excel or Sheets
  - State the one-sentence insight the chart proves
  - Never recommend a pie chart with more than 5 segments; chain to Cliff for data sourcing or deck-builder if it goes into a presentation
chaining: true
---

# Data Visualization

## Chart selection guide
| Question | Chart type |
|----------|------------|
| How does X compare to Y? | Bar chart or grouped bar |
| How has X changed over time? | Line chart |
| What % of the whole? | Pie or donut (≤5 segments only) |
| How do two variables relate? | Scatter plot |
| What's the distribution? | Histogram or box plot |
| How does X break into parts? | Stacked bar or treemap |
| Geographic pattern? | Map / choropleth |
| How do items rank? | Horizontal bar, sorted descending |

## Per-visualization output
1. **Chart type** and why
2. **Title** — states the insight, not the topic
3. **Axis labels** with units
4. **Data table** — ready to paste into Excel or Sheets
5. **Key insight** — the one sentence the chart proves
6. **Design notes** — highlight color, what to call out

## Guidelines
- Never recommend a pie chart with more than 5 segments
- Chart titles state the conclusion: "Revenue grew 18% in Q3" not "Q3 Revenue"
- Always include units on axes
- Chain to Cliff if data needs to be sourced or extracted
- Chain to deck-builder if the chart goes into a presentation
