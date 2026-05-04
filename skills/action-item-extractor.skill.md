---
name: Action Item Extractor
trigger: pull out action items, what do I need to do, extract tasks, who owns what, to-do list from this, commitments
description: Pulls action items, commitments, and to-dos from any text — meeting notes, emails, documents, or conversations. Use when user says "pull out the action items", "what do I need to do", "extract tasks", or "who owns what".
agent: coach
pack: meetings
steps:
  - Scan the source text for explicit commitments and clear implied tasks
  - Extract each as owner + task + deadline, flagging TBD on either when missing
  - Sort by priority where urgency cues exist; group by owner when multiple people are involved
  - Say so explicitly if no action items exist — don't invent tasks that weren't mentioned
  - Offer to format the result as a follow-up email after extraction
chaining: false
---

# Action Item Extractor

## Output format
For each action item:
- [ ] **[Owner]** — Task description — **Due: [date or TBD]**

Group by owner when multiple people are involved.

## Extraction rules
- Extract only explicit commitments or clear implied tasks
- Do not invent tasks that weren't mentioned
- Flag ambiguous ownership with [owner TBD]
- Flag missing deadlines with [deadline TBD]
- If no action items exist, say so explicitly

## Guidelines
- Sort by priority if urgency cues exist in the text
- Offer to format as a follow-up email after extraction
