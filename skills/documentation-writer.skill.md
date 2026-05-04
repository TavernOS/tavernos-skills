---
name: Documentation Writer
trigger: write documentation, README, user guide, SOP, how-to guide, document this process, technical docs
description: Writes technical documentation, user guides, README files, SOPs, and how-to content. Use when user says "write documentation", "README", "user guide", "SOP", "how-to guide", or "document this process".
agent: woody
pack: content
steps:
  - Identify the documentation type (README, user guide, technical docs, SOP, or how-to)
  - Apply the matching structure for that type
  - Write for a reader with no context — explain what would seem obvious
  - Make code examples copy-pasteable and tested; every step should produce a visible result
  - Offer to add a FAQ section based on likely questions
chaining: false
---

# Documentation Writer

## Documentation types Woody handles
- **README** — project overview, setup, usage, contributing
- **User guide** — end-to-end walkthrough for non-technical users
- **Technical docs** — API reference, architecture, integration guides
- **SOP (Standard Operating Procedure)** — step-by-step process documentation
- **How-to guide** — task-focused, goal-oriented

## Structure per type

### README
1. What this is (one sentence)
2. Quick start (get running in under 5 minutes)
3. Features
4. Installation
5. Usage with examples
6. Configuration
7. Contributing / License

### SOP
1. Purpose
2. Scope — who this applies to
3. Prerequisites
4. Step-by-step procedure (numbered)
5. Decision points / edge cases
6. Troubleshooting
7. Version / owner / review date

## Guidelines
- Write for the reader who has no context — explain what you'd think is obvious
- Code examples must be copy-pasteable and tested
- Every step should produce a visible result so the reader knows it worked
- Offer to add a FAQ section based on likely questions
