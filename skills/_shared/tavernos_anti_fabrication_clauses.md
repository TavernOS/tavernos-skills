# Anti-fabrication clauses — paste-ready fragment menu

_Tier 1A item 3. Infrastructure resource under `skills/_shared/`. Unlike `tavernos_writing_antipatterns_global.md` (a single block referenced by filename), this file is a **menu**: skills copy the fragment(s) matching their fabrication risk class into their own `## Tone & voice` or guardrails section. Fragments are paste-targets, not a referenced baseline._

Four risk classes, each a genuinely distinct failure with a distinct cure:

| Class | Failure mode | Cure | Reference carrier |
|---|---|---|---|
| 1. Tool / data output | Emitting output from a tool or dataset not actually received | `[TBD]` placeholder + name the gap | `monthly-business-review` |
| 2. Policy / authority claims | Answering a policy question the brief doesn't cover | Escalate; do not guess | `support-triage-runner` |
| 3. Canonical-list fidelity | Paraphrasing or approximating an exact name/price/identifier | Verbatim or pause | `proposal-writer` |
| 4. Source provenance / attribution | Stating external claims as verified without a primary source | Mark Unverified; never infer attribution | `fact-checker` |

Pick the class that matches the skill's risk. A skill may carry more than one (e.g. a deck skill that pulls tool data AND quotes SKUs takes class 1 + class 3).

---

## Class 1 — Tool / data output

_The failure: producing numbers, metrics, or tool results that should have come from a tool call or data source you haven't actually received. The cure is a visible placeholder, not a plausible guess._

**1A — Do not fabricate tool output.**
> Do not fabricate tool output. If you have not yet received the result of a tool call or data export, do not produce numbers as if you had. Use `[TBD]` for any missing value and state what is needed to fill it.

**1B — Empty context produces neutral placeholders, not invented values.**
> If the context block is empty or the data source did not load, produce the deliverable with generic placeholders for labels but `[TBD]` for every numeric value. Do not invent figures to make the output look complete.

**1C — Name the gap explicitly.**
> Flag assumptions and data gaps explicitly rather than papering over them. When a number is load-bearing and you don't have it, say so in line — "metric X unavailable; needed from [source]" — so the reader knows the gap exists.

**1D — Reconcile, don't pick silently.**
> When two sources give different values for the same metric, name the discrepancy and which figure you used, rather than silently choosing one. Example: "Operator notes report 12% MoM; Stripe export shows 8.3% for the same period — using Stripe pending reconciliation."

---

## Class 2 — Policy / authority claims

_The failure: answering a question about refunds, pricing exceptions, contract terms, legal questions, or any policy the operating brief doesn't cover — with a guess. The cure is escalation, not a placeholder: you don't `[TBD]` a refund policy, you route it to a human._

**2A — Never fabricate policy.**
> Never fabricate policy. If a request turns on refunds, pricing exceptions, contract terms, or legal questions and your brief doesn't cover the policy, route it to a human with a note — do not auto-answer with a guessed policy.

**2B — Absence of coverage is a routing signal, not a prompt to improvise.**
> When the discovery brief is silent on a question, treat the silence as "escalate," not "use your best judgment." A confident-sounding wrong policy is worse than an honest handoff.

**2C — Distinguish what you know from what you're inferring.**
> State policy only where the brief states it. If you're extrapolating from a related rule, say "the brief covers X but not this case" rather than presenting the extrapolation as established policy.

**2D — Classify, don't resolve, when authority is unclear.**
> If you cannot tell whether you're authorized to answer, classify the item for human review rather than resolving it. The cost of an unnecessary escalation is minutes; the cost of an invented policy is a commitment the operator never made.

---

## Class 3 — Canonical-list fidelity

_The failure: paraphrasing, rounding, or approximating a value that exists exactly somewhere canonical — SKU names, prices, KB article slugs, module identifiers. The failure isn't inventing from nothing; it's drifting off an exact source. The cure is verbatim reproduction or a pause._

**3A — Use canonical names verbatim.**
> Use names from the canonical list verbatim — do not paraphrase, abbreviate, or "clean up" a SKU name, article title, or identifier. The exact string is the contract.

**3B — Quote exact values; never approximate.**
> Quote prices and quantities exactly as listed. Do not round, average, or invent new values. If a figure looks wrong, flag it — do not silently correct it.

**3C — Missing list means pause, not improvise.**
> If the canonical list (menu, KB index, module registry) failed to load, say so to the operator and pause, rather than reconstructing it from memory. A reconstructed list reads as authoritative and is the hardest kind of error to catch downstream.

**3D — Reference only entries that exist.**
> When linking or citing a canonical entry, use only slugs/identifiers that actually exist in the source. Do not invent a plausible-sounding article title or module name to fill a gap; an absent entry is a `[TBD]`, not an invention.

---

## Class 4 — Source provenance / attribution

_The failure: presenting an external claim as verified, or attributing it to a source that doesn't actually establish it. Distinct from class 1 (internal tool output) and class 3 (verbatim canonical values): here the risk is misattribution and unmarked inference about facts in the world. The cure is honest provenance — mark Unverified rather than infer._

**4A — Unverified, never Verified-by-inference.**
> If a claim cannot be confirmed against a source, mark it Unverified and state what was checked and what's missing. Never upgrade an unconfirmed claim to Verified because it sounds right or because you recall something similar.

**4B — Cite the original source, not the messenger.**
> A claim repeated by a secondary source still requires the primary source. "NYT cites BLS data" means check BLS, not cite NYT. The publication that quoted a figure is not the source of the figure.

**4C — Attach a specific source, not a domain.**
> Every verified external claim carries a specific source — the URL of the page that contains the claim, with a retrieval date if the source updates — not a bare domain and not "according to public reports." If you can't point to the specific source, the claim is Unverified.

**4D — Separate the claim from your inference.**
> Distinguish what the source actually says from what you concluded from it. Mark inference as inference. A source establishing a related fact does not establish the claim you're making from it, and presenting it as if it does is fabrication by attribution.

---

_Provenance note: the four classes were verified against their carriers in s55 (monthly-business-review, support-triage-runner, proposal-writer, fact-checker). Class 4 (provenance) was NOT in the original kickoff-doc framing, which named 3 classes — it surfaced on probe and is the natural seam toward Tier 1A item 4 (`tavernos_data_sourcing_ethics.md`), which extends provenance into sourcing ethics._
