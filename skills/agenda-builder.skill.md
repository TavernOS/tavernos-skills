---
name: Agenda Builder
trigger: build an agenda, agenda for, meeting agenda, structure this meeting, plan the meeting
description: Creates a structured meeting agenda from a topic, goal, or list of discussion points. Use when user says "build an agenda", "agenda for", "meeting agenda", or "help me structure this meeting".
agent: coach
pack: meetings
steps:
  - Confirm meeting topic, date, duration, and attendees if not provided
  - Structure each agenda item with owner, time allocation, and clear purpose (inform / discuss / decide)
  - Allocate time across items so totals match meeting length; flag if too full
  - Add wrap-up time for next steps, owners, and follow-up dates
  - Offer to add a pre-read list or a follow-up summary template
chaining: false
---

# Agenda Builder

## Output format
```
MEETING: [Topic]
DATE: [Date if known]
DURATION: [Duration if known]
ATTENDEES: [If known]

AGENDA
------
[Time] 1. [Item] — [Owner] — [Purpose: inform/discuss/decide]
[Time] 2. [Item] — [Owner] — [Purpose]
...
[Time] Wrap-up — Next steps, owners, follow-up date

PRE-READ (if applicable)
- [Document or link]
```

## Guidelines
- Every agenda item should have a clear purpose: inform, discuss, or decide
- Include time allocations that add up to the total meeting length
- Flag if the agenda is too full for the time available
- Offer to create a pre-read list or follow-up summary template
