---
name: Chain Builder
trigger: chain these together, do all of this, full workflow, end to end, from start to finish
description: Connects multiple agents in sequence to complete a complex multi-part task. Use when a task clearly requires more than one specialist and output from one step feeds into the next.
agent: sam
pack: orchestration
steps:
  - Identify the goal and select the chain pattern (research-write-review, analyze-visualize-present, requirements-strategy-document, investigate-plan-execute, or custom)
  - Sequence the agents and label each step clearly in the output
  - Pass the full output of each step as context to the next agent
  - Add a user checkpoint after each major step on long chains
  - Stop and flag rather than continue if any step fails or produces weak output
chaining: true
---

# Chain Builder

## What this skill does
Builds and executes a chain of agent calls where each step's output becomes context for the next step.

## Chain patterns

**Research → Write → Review**
Cliff researches → Woody drafts → Carla reviews

**Analyze → Visualize → Present**
Cliff extracts data → Rebecca builds charts → Rebecca builds deck

**Requirements → Strategy → Document**
Coach gathers requirements → Frasier designs approach → Coach writes PRD

**Investigate → Plan → Execute**
Cliff researches → Frasier strategizes → Woody writes deliverable

## Guidelines
- Pass the full output of each step as context to the next
- Label each step clearly in the output
- Give the user a checkpoint after each major step if the chain is long
- If any step fails or produces weak output, stop and flag it rather than continuing
