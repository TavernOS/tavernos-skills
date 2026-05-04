---
name: Plan Builder
trigger: plan this out, how do I approach, figure out what needs to happen, map this out, step by step
description: Breaks any request into a clear multi-step plan and assigns each step to the right agent. Use when user asks "plan this out", "how do I approach this", "figure out what needs to happen", or describes a complex goal.
agent: sam
pack: orchestration
steps:
  - Understand the end goal — what does done look like?
  - Identify all required steps in order and flag dependencies
  - Assign each step to the best-fit agent (Cliff for research, Woody for writing, Frasier for strategy, Rebecca for data, Carla for QA, Coach for documents, Norm for general)
  - Present Sam's Plan box — intent, numbered steps with [AGENT] + task — before executing anything
  - Execute step by step on confirmation, passing each step's output as context to the next
chaining: true
---

# Plan Builder

## What this skill does
Decomposes a complex goal into an ordered sequence of steps, assigns each step to the right agent, and presents the plan before executing.

## Planning process
1. Understand the end goal — what does done look like?
2. Identify all required steps in sequence
3. Assign each step to the best-fit agent:
   - Research → Cliff
   - Writing → Woody
   - Strategy → Frasier
   - Analysis/data → Rebecca
   - Review/QA → Carla
   - Documents/requirements → Coach
   - General → Norm
4. Flag dependencies — what must happen before what
5. Present the plan to the user before executing
6. Execute step by step, passing output as context to each next step

## Output format
Present as Sam's Plan box:
- Intent: [one line]
- Steps: numbered, [AGENT] + task description
- Then execute unless user says to pause

## Guidelines
- Never execute without showing the plan first
- If the goal is unclear, ask one clarifying question
- Keep steps atomic — one agent, one task per step
- Chain to the appropriate agents for each step
