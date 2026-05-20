# TavernOS Confidence Tiers

Two distinct judgment scales used across TavernOS skills. They are **orthogonal** — assess each separately for any given claim or finding. A single observation often has both a source-quality tier (about its citation) AND an evidence-confidence tier (about how strongly the available evidence supports the conclusion). They do not collapse into a single scale.

- **Source-quality tier** (T1 / T2 / T3) — How authoritative is the source itself? Used by `fact-checker` and any skill that cites external sources.
- **Evidence-confidence tier** (H / M / L) — How strongly does the available evidence support the finding? Used by `client-intake`, `ops-audit`, `bottleneck-mapping`, `support-response-library`, and any skill that produces findings from operator-supplied evidence.

---

## Source-quality tier

How authoritative is the source itself, independent of what it says or how strong the supporting evidence is for any specific claim.

### Tier 1 — primary / authoritative

The source of the claim. The entity that produced or possesses the underlying data, or the record of original action.

- Government databases and filings — BLS, FRED, SEC EDGAR (10-K, 10-Q, S-1), FDA, ICH, USPTO, court records
- Company financial filings and audited statements for company-financial claims
- Original peer-reviewed research papers for empirical claims (the paper, not press coverage of it)
- The named entity's own current public site for current organizational facts (current leadership, current office locations, current stated policies)
- Statutory and regulatory text for legal claims

### Tier 2 — secondary / reputable

Reports the claim with editorial accountability, but isn't the source itself.

- Established journalism with editorial standards — NYT, WSJ, Reuters, FT, Bloomberg, AP
- Trade publications with editorial review — Stat News, Industry Dive, AdWeek, Crain's
- Independent research organizations — Pew, RAND, Brookings, Gartner (commissioned reports caveated)
- Academic working papers and pre-prints — credentialed authors, not yet peer-reviewed
- Industry-association reports with named methodology

### Tier 3 — tertiary / aggregator

Recycles, compiles, or republishes claims from other sources without independent verification.

- Wikipedia (cites other sources; check what it cites, not Wikipedia itself)
- Crunchbase, PitchBook free tier, similar databases (compiled from press releases and self-reports)
- News aggregators — Yahoo News, MSN, Google News headlines
- LinkedIn employee counts (self-reported by the company; subject to definition variance)
- Glassdoor company stats (self-selecting respondents)
- Forum posts, Reddit, Quora, blog comments
- AI-generated summary pages and SEO content farms

### Selection rule

Always prefer the highest tier available for a given claim. Tier 3 is a starting point that points at higher-tier sources, not a stopping point. If a claim appears in a Tier 2 article citing a Tier 1 source ("BLS data shows..."), the source is the Tier 1 — check BLS directly, not the article that cites it.

For claims about a specific entity, that entity's own current public filings and statements are Tier 1 for organizational facts (current employees, current officers, stated policies) but NOT for self-promotional claims (market leadership, customer satisfaction, technology superiority — those need independent Tier 1 or Tier 2 validation).

### Common confusion — citation chain

A claim appearing in NYT citing BLS data is a Tier 1 BLS claim, not a Tier 2 NYT claim. Check BLS. The NYT-cites-BLS step is a finding aid, not a source. If checking the original is impossible (paywalled, link rot, removed), state that explicitly and assign the tier of the highest source actually inspected — not the highest source claimed in the chain.

### Common confusion — high-tier source, weak claim type

A peer-reviewed journal is Tier 1 for the findings it reports. But the abstract's framing may differ from what the data actually supports. A paper finding "X correlates with Y" cited as "X causes Y" is a Tier 1 source supporting a misrepresented claim. Source tier doesn't validate the claim's accuracy to what the source actually says — that's a separate check.

---

## Evidence-confidence tier

How strongly does the available evidence support the finding, independent of source quality. Used when a skill produces findings from operator-supplied evidence (audits, interviews, observations, instrumentation data) rather than from cited external sources.

### H — high confidence

The finding is directly demonstrated, not inferred. Multiple independent evidence streams converge. Recent enough to be current.

- Finding is reproducible (the issue can be triggered on demand)
- Multiple independent stakeholders report the same finding without prompting
- Quantitative data is current, complete, and from instrumented sources
- The causal chain is observable, not assumed

Examples:
- "Customer onboarding email is broken." — Three independent tickets reference the same broken link in the last seven days, plus a QA reproduction. H.
- "Revenue grew 30% YoY in Q3." — Pulled live from financial dashboard, accountant-confirmed against the GL. H.
- "The deployment pipeline fails on dependencies updated after March." — Reproducible build log, fails on every attempt with March+ dependencies, passes when pinned. H.

### M — medium confidence

The finding is supported by partial evidence, a single source, or evidence-with-inference. The pattern is real but the mechanism is plausible rather than proven, or the sample is limited.

- One stakeholder's account, no triangulation
- Quantitative trend visible but baseline is short
- Pattern is present in the data but causal mechanism is inferred
- Evidence is from a self-interested party (the team that owns the process being audited)

Examples:
- "Customer support response times are slowing." — Support manager's anecdotal report + one week of metrics showing an uptick, no longitudinal baseline to compare against. M.
- "The new pricing page is underperforming." — 20% conversion drop in the first week after launch + no other variables changed, but no controlled A/B test. M.
- "Team morale is declining." — Three of nine 1:1s mentioned frustration with the new tooling; six did not. M.

### L — low confidence

The finding is suggested but not demonstrated. Significant gaps in evidence. Plausible alternative explanations have not been ruled out.

- Single non-triangulated anecdote
- Pattern inferred from absence (assumes-because-not-seen)
- Source has clear incentive to overstate or understate
- Evidence is several inferences removed from the finding

Examples:
- "The engineering team is burnt out." — One comment in a retro; no survey, no PTO data, no attendance pattern. L.
- "Acme Corp is planning to exit our segment." — Industry forum post by an anonymous user, no corroborating signals. L.
- "Marketing spend is being wasted." — Spend is up YoY but attribution is unclear; no campaign-level analysis available. L.

### Selection rule

**Mark down, not up.** When in doubt between H and M, choose M. When in doubt between M and L, choose L. A wrong-H finding gets acted on with confidence proportional to its tier; the downstream cost of acting on a fabricated H is much higher than the cost of a real H downgraded to M.

### Common confusion — confidence is not importance

A high-confidence finding may be trivial. A low-confidence finding may be load-bearing for the engagement. State both — the confidence and the materiality — and let the operator weigh them.

### Common confusion — source quality vs evidence confidence

The two scales are orthogonal. Examples of all four corners:

- **T1 + H** — Stripe processed $1T in payments in 2023. Source: Stripe's annual report (T1). Evidence: direct statement, numerically specific, recent. H. *Strongest possible claim.*
- **T1 + L** — A company 10-K's narrative section states "we believe our customer satisfaction is industry-leading." Source: SEC filing (T1). Evidence: self-assertion with no underlying metric. L. *Authoritative source, weak claim.*
- **T3 + H** — A small company's LinkedIn page shows 47 employees. Source: LinkedIn self-report (T3). Evidence: corroborated by their About page, their team page, and a recent press release naming the same headcount. H. *Weak source, well-corroborated finding.*
- **T3 + L** — Anonymous forum post claims Acme is closing its London office. Source: forum (T3). Evidence: single uncorroborated post. L. *Both weak.*

Assess each scale separately. The combination signals what the operator should do with the claim, not whether to keep it.

---

## How skills reference this resource

Skills cite this resource by filename:

> "Source quality assessed per `tavernos_confidence_tiers.md` (Source-quality tier subsection)."
> "Finding confidence per `tavernos_confidence_tiers.md` (Evidence-confidence tier subsection)."

Place references in the skill's `## Output format` (where the tier is assigned per-finding) and `## Verification` (where the tier assignment is checked against the rules above).

Skills that use only one scale reference only that subsection. Skills that use both reference both. The resource itself does not need to be inlined — the reference is enough; skills should not duplicate the tier definitions in their own bodies.

### Currently referencing skills

- `fact-checker` — Source-quality tier (primary user; assigns T1/T2/T3 to every Verified verdict)
- `client-intake` — Evidence-confidence tier (assigns H/M/L to findings from intake interviews and document review)
- `ops-audit` — Evidence-confidence tier (assigns H/M/L to findings from operational audits)
- `bottleneck-mapping` — Evidence-confidence tier (assigns H/M/L to identified bottlenecks)
- `support-response-library` — Evidence-confidence tier (assigns H/M/L to inferred response templates from ticket history)
