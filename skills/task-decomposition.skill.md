---
name: Task Decomposition
trigger: break this down, help me figure out, where do I start, this is too big, I'm not sure how to
description: Breaks a large, vague, or complex task into clear manageable pieces. Use when a request is too broad, when the user seems overwhelmed, or when "just do X" would produce poor results without more structure.
agent: norm
pack: core
steps:
  - Identify the actual end goal — not just the stated task
  - List all sub-tasks required to reach it, in logical sequence
  - Estimate complexity per step (quick / medium / involved) and flag any that need a specialist agent
  - Present as a numbered checklist with route-to-agent annotations
  - Close with 'Want me to start on any of these?' — don't execute until confirmed
chaining: true
---

# Task Decomposition

## What this skill does
Takes a big messy task and breaks it into clearly defined, achievable pieces.

## Decomposition process
1. Identify the actual end goal (not just the stated task)
2. List all sub-tasks required to reach it
3. Sequence them in logical order
4. Flag any that require a specialist agent
5. Estimate rough complexity: quick / medium / involved
6. Present as a numbered checklist

## Output format
- Numbered list of sub-tasks
- Each marked: [QUICK], [MEDIUM], or [INVOLVED]
- Flag which tasks need a different agent with: → route to [AGENT]
- End with: "Want me to start on any of these?"

## Guidelines
- The user may not know what they actually need — decompose to the level that reveals that
- Don't start executing until the breakdown is confirmed
- If the task is actually simple, say so and just do it
