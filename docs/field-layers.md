# Field-Specific Layers

The cross-domain templates in [templates/](../templates/) cover universal scholarly work. Discipline-specific work also needs its own scaffolding. This doc indexes the per-field templates and conventions.

## Math and theoretical CS

Template: [templates/proof.md](../templates/proof.md).

Conventions:

- Every theorem gets its own page with `type: theorem` frontmatter.
- A theorem page must list `depends-on:` (other theorems / lemmas / definitions) and is linked back from `used-by:` on those pages.
- Counterexamples are first-class. A theorem page's "Counterarguments" section holds the canonical counterexample to the **converse** or to common over-generalizations.
- Proof status: `sketch | full | informal | reproduced`. Only `full` and `reproduced` may have `status: grounded`.
- LaTeX in math blocks: `$inline$` and `$$display$$`. Renders natively in Obsidian.

## Law

Template: [templates/case-brief.md](../templates/case-brief.md) — IRAC structure (Issue, Rule, Application, Conclusion) plus holding/dicta distinction.

Conventions:

- One page per case, statute, regulation, or doctrinal test.
- Frontmatter: `jurisdiction`, `court`, `decided`, `citation`, `precedential` (binding/persuasive/superseded).
- Holding vs dicta is rendered as two distinct sections — never blurred.
- Precedent trees: each case page lists `cites:` and is back-linked under `cited-by:` on the targets.
- Distinguishing cases get their own `wiki/comparison/<case-A>-vs-<case-B>.md`.

## Empirical / experimental sciences

Template: [templates/experiment.md](../templates/experiment.md).

Conventions:

- Every empirical claim cited from a paper records `n`, effect size, confidence interval, replication status, preregistration, conflicts of interest.
- Replication status flags: `original` / `replicated-direct` / `replicated-conceptual` / `failed-replication` / `retracted` / `unattempted`.
- A `failed-replication` flag on any source automatically demotes pages relying on it to `status: stale` until reviewed.
- Cross-check claims against the [Reproducibility Project](https://www.cos.io/initiatives/reproducibility-project), [RetractionWatch](https://retractionwatch.com/), and [OSF Registries](https://osf.io/registries) when `/es-falsify`-ing.

## History and the humanities

Template: [templates/source-position.md](../templates/source-position.md).

Conventions:

- **Always distinguish the source's position from your reading of it.** A source is a thing in the world; your interpretation is a hypothesis about it. Both belong on the page, separately.
- Schools of thought (Annales, Cambridge School, Subaltern Studies, Frankfurt School, etc.) get standing entity pages with named advocates, primary critiques, and load-bearing texts.
- Primary vs secondary sources are tier-distinguished and never collapsed.
- `historiography` tag on any page where the methodological debate matters more than the factual content.

## Cross-field: lineage

Template: [templates/lineage.md](../templates/lineage.md).

Every grounded thinker entity page can carry an intellectual lineage block: teachers, students, influences, breaks-with. Forms a graph orthogonal to the concept graph. Useful in philosophy, mathematics, history of science, literary theory, law.

## Cross-field: experiment vs argument

Different fields validate claims differently ([source-discipline.md](source-discipline.md#L60)). When a claim crosses fields (e.g. "evolutionary psychology supports X philosophical position"), the wiki page must explicitly note **both** validation regimes and where they conflict.

## When a field is not yet covered

Default to the universal scaffolding ([templates/wiki-page.md](../templates/wiki-page.md), [templates/source-pack.md](../templates/source-pack.md), [templates/claim-ledger.md](../templates/claim-ledger.md)) and propose a field-specific template via `/es-update-atlas` when the gap becomes load-bearing.
