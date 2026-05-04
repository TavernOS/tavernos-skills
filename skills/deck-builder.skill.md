---
name: Deck Builder
trigger: slide deck, presentation, slides, PowerPoint, pitch deck, build me a deck, deck
description: Builds slide deck outlines and slide-by-slide content for any presentation. Use when user mentions "slide deck", "presentation", "slides", "PowerPoint", "pitch deck", or "build me a deck".
agent: rebecca-deck
pack: presentations
steps:
  - Confirm the audience and purpose if not provided
  - Outline the deck using the standard architecture — title, agenda (if 10+), context, problem, content slides, recommendation, next steps, appendix
  - For each slide, write a 6-word title, an argument-stating headline, body content, and a speaker note
  - Enforce one idea per slide; headlines argue rather than label ('Q3 revenue grew 18%' not 'Q3 Performance')
  - Chain to Cliff for underlying research, Frasier for strategic narrative, or Carla for QA review
chaining: true
---

# Deck Builder

## Standard deck architecture
1. Title slide
2. Agenda / overview (for decks over 10 slides)
3. Situation / context
4. Problem or opportunity
5. [Content slides — one idea each]
6. Recommendation or ask
7. Next steps — specific, dated, owned
8. Appendix — backup slides, supporting data

## Per-slide output
- **Slide title** — 6 words or fewer
- **Headline** — one sentence that IS the argument (not a topic label)
- **Body** — bullets, data, or visual description
- **Speaker note** — what to say that isn't on the slide

## Slide principles
- One idea per slide — two ideas means two slides
- Headlines argue, they don't label: "Q3 revenue grew 18%" not "Q3 Performance"
- Less text is almost always better

## Guidelines
- Ask for audience and purpose if not provided
- Chain to Cliff if underlying data or research is needed
- Chain to Frasier if strategic narrative is needed
- Chain to Carla for quality review before the deck is shared
