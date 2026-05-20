# TavernOS Writing Antipatterns — Global Baseline

The words and phrases below are the generic-LLM-prose tells that mark any TavernOS output as machine-written. They are banned across **every** skill that produces prose for a human reader — client deliverables, operator-facing notes, proposals, critiques. This is the **global baseline**: the shared layer.

Individual skills add **persona-specific extensions** in their own `## Tone & voice` section — Cliff's empirical fillers, Woody's proposal-register tells, Carla's structural critique targets. Those stay in the skill. This file is only the common floor every skill enforces; a skill's tone section names its own additions on top.

The test is not "is this word forbidden in English" — these words have legitimate uses. The test is: **does this phrase appear because it's the right word, or because it's the autocomplete default?** If a human writer who knew the subject would have reached for something more specific, the generic phrase is a tell. Generic prose reads as interchangeable, and interchangeable is the one thing a TavernOS deliverable cannot be — interchangeable means the client could have generated it themselves, which is the same as the client canceling.

---

## Banned words and phrases

### Corporate-jargon nouns and verbs

These are the highest-frequency tells. None survives contact with a specific alternative.

- **leverage** (any form) — use "use," or name the specific mechanism
- **synergy** / **synergies** — name the actual interaction
- **robust** — say what makes it sturdy, or cut it
- **solution** as a standalone noun — use "approach," "system," or just say what the thing is
- **best-in-class** — a claim with no content; state the measurable advantage or drop it
- **cutting-edge** — same; either name what's new or don't claim novelty
- **deep dive** / **unpack** — use "examine," "go through," or name the actual action
- **innovative** — show the thing that's new; don't assert the adjective

### Stock filler openers and connectives

Phrases that exist to occupy space before a sentence starts carrying information.

- **"In today's fast-paced world"** / **"In today's rapidly evolving landscape"** / any sentence opening with **"In today's…"**
- **"It's important to note"** — if it's important, the importance is in the content, not the announcement
- **"At the end of the day"**
- **"We pride ourselves on…"**

### Hype constructions

- **"best-in-class methodologies," "comprehensive solution," "measurable results"** as a cluster — the executive-summary autopilot phrasing
- Vague-magnitude words used in place of numbers — **"significant," "substantial," "considerable"** — replace with the actual figure (hours, dollars, dates, percentages)

---

## The replacement discipline

Banning a word only helps if something better takes its place. The fix for every entry above is the same move: **replace the generic with the specific.**

- Not "leverage our expertise" → "the three things we'd do first"
- Not "significant time savings" → "6 hours a week"
- Not "robust system" → "handles 40 concurrent users without a queue"
- Not "innovative approach" → describe the approach; let the reader judge whether it's new

If the specific replacement isn't available — if you reach for "significant" because you don't actually have the number — that's a signal the underlying content is thin, not that you need a better adjective. Get the number, or say plainly that it's not yet measured.

---

## How skills reference this resource

Skills cite this resource by filename in their `## Tone & voice` section:

> "Generic-prose tells banned per `tavernos_writing_antipatterns_global.md` (global baseline). Persona extensions below."

The skill then lists only its **persona-specific additions** beneath the reference — it does not duplicate the global list. The two-layer contract is: this file holds the floor, the skill holds its own ceiling.

A skill that has no persona-specific tells beyond the baseline references this file and adds nothing further. A skill whose entire prose discipline is structural rather than lexical (a critique skill flagging buried ledes or mixed audiences, not banned words) references this file for the lexical floor and keeps its structural taxonomy local — that taxonomy is a different kind of rule and is not promoted here.

### Currently referencing skills

- `proposal-writer` — most extensive persona extension (Woody's proposal-register tells: "We pride ourselves on…", standalone "solution," prospect's-own-phrasing rule)
- `content-batch-draft` — references baseline; persona layer defers to the client Voice Profile, which flags tells per-client
- `fact-checker` — Cliff persona extension (empirical fillers: "veracity assessment," "ground truth," "fact-check rigor" used as filler)
- `grill-me` — Carla references the baseline as a critique target ("generic AI slop, name it"); her structural-critique taxonomy (buried point, mixed audiences, apologetic hedges, missing ask) stays local as persona-specific
