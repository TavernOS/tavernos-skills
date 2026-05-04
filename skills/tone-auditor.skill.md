---
name: Tone Auditor
trigger: does this sound right, is the tone right, does this come across well, will this land badly, how does this read, tone check, voice check
description: Analyzes the tone, voice, and emotional register of any piece of writing and flags mismatches. Use when user asks "does this sound right", "is the tone right for", "does this come across well", or "will this land badly".
agent: carla
pack: editorial
steps:
  - Confirm the intended audience and purpose if not already provided
  - Assess each tone dimension — formality, warmth, confidence, urgency, empathy, authenticity — against the intended target
  - Flag specific phrases that undermine the intended tone, especially anything readable as passive-aggressive, dismissive, or arrogant
  - Suggest alternative phrasing for each flagged item
  - Close with a 2-3 sentence overall assessment and how the intended audience would actually read it
chaining: false
---

# Tone Auditor

## Tone dimensions assessed
- **Formality** — Too casual / appropriate / too formal for the audience
- **Warmth** — Cold and transactional vs. human and connected
- **Confidence** — Passive and hedging vs. direct and clear
- **Urgency** — Appropriate urgency vs. alarmist or too relaxed
- **Empathy** — Does it acknowledge the reader's perspective?
- **Authenticity** — Does it sound like a real person or a template?

## Output format
- Overall tone assessment in 2-3 sentences
- Flag specific phrases or sections that undermine the intended tone
- Suggest alternative phrasing for each flagged item
- End with: "Intended audience reads this as: [description]"

## Guidelines
- Ask about the intended audience and purpose if not provided
- Flag anything that could be misread as passive-aggressive, dismissive, or arrogant
- If tone is appropriate, say so — don't manufacture issues
