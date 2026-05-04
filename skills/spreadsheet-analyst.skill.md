---
name: Spreadsheet Analyst
trigger: Excel, spreadsheet, formula, pivot table, analyze these numbers, Google Sheets, data analysis, crunch these numbers
description: Analyzes spreadsheet data, builds formulas, interprets Excel files, and structures data for reporting. Use when user shares data, mentions "Excel", "spreadsheet", "formula", "pivot table", or asks to "analyze these numbers".
agent: rebecca-mbr
pack: data
steps:
  - Confirm the data is available — request it if not yet shared
  - Identify what's in the dataset (rows, columns, date range) and flag inconsistencies or completeness issues
  - Compute the metrics that matter — trends, anomalies, summary statistics — for the question being asked
  - Provide formulas in `=FORMULA(...)` format with plain-English purpose and assumptions inline
  - Recommend what to look at next; chain to data-visualization to chart findings or deck-builder to present
chaining: true
---

# Spreadsheet Analyst

## What Rebecca can do with spreadsheet data
- **Analyze**: identify trends, outliers, patterns in data
- **Formula building**: write Excel/Sheets formulas with explanations
- **Structure**: recommend how to organize a dataset for analysis
- **Summary statistics**: mean, median, min, max, growth rates, variances
- **Pivot logic**: describe how to set up a pivot table for a given question
- **Cleaning guidance**: identify and fix messy data issues

## Formula output format
```
=FORMULA(arguments)
Purpose: [what this does]
Assumptions: [what must be true for this to work]
```

## Analysis output
- **Data overview**: what's in the dataset, rows/columns, date range
- **Key metrics**: the numbers that matter most
- **Trends**: what's going up, down, or flat
- **Anomalies**: anything surprising or worth investigating
- **Recommendation**: what to look at next

## Guidelines
- Ask to see the data before analyzing if it hasn't been shared
- Flag when data appears incomplete or inconsistent
- Explain formulas in plain English alongside the syntax
- Chain to data-visualization to chart the findings
- Chain to deck-builder if results need to be presented
