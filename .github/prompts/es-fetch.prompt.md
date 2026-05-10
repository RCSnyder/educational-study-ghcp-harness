---
name: es-fetch
description: Emit a deterministic academic-API search plan for a topic, source, or open claim
argument-hint: "<topic | open question | missing cite-key>"
agent: "agent"
---

## Operating contract

Per [docs/academic-apis.md](../../docs/academic-apis.md): research-grade claims use academic APIs (Semantic Scholar, OpenAlex, arXiv, PubMed, Crossref, etc.) **before** generic web search. This command does not browse — it emits a search plan the user (or a human-in-the-loop step) can execute, plus the protocol for ingesting results.

# EDUCATIONAL STUDY — FETCH

## Step 1 — Classify the target

- Empirical / clinical → PubMed (Tier 0), then Semantic Scholar (Tier 0).
- Math / theoretical CS → arXiv (Tier 1), then Semantic Scholar.
- Social science / general → Semantic Scholar, OpenAlex, Crossref.
- Law → CourtListener, official reporters.
- History / humanities text → Internet Archive, HathiTrust, JSTOR Constellate, LoC.
- Citation graph (forward / backward) → OpenCitations, OpenAlex.

## Step 2 — Emit the plan

For each relevant API, output:

- Endpoint or query template.
- Concrete query string (formed from the user's argument).
- Filters: year range, peer-reviewed only, study type, jurisdiction, etc.
- Expected result shape.
- Tier of any retrieved source under `docs/source-discipline.md`.

Example structure:

```text
[1] Semantic Scholar — graph/v1/paper/search
    query: "mean-field game theory replicator dynamics"
    fields: title, authors, year, citationCount, openAccessPdf
    filter: year>=2010, fieldsOfStudy=Mathematics

[2] OpenAlex — works
    search: "mean-field game replicator"
    filter: type=journal-article, has_oa_url=true

[3] Crossref — DOI lookup for any candidate from [1] or [2].
```

## Step 3 — Adversarial sweep

For high-stakes claims, also emit one query designed to **find disconfirming results**: "<claim> OR <opposite>", "<claim> failed replication", "<claim> retracted", "<claim> critique."

## Step 4 — Ingest protocol

Once the user retrieves results, the next step is:

- `/es-ingest <path-to-saved-result>` for full sources.
- For bibliography only: write `wiki/bib/<key>.md` with CSL-JSON or BibTeX per [templates/citation.md](../../templates/citation.md).

## Step 5 — Provenance trail

Log the search plan to `wiki/log.md`:

```text
## [YYYY-MM-DD] fetch | <target>
- APIs queried: <list>
- Result count: <if known>
- Saved to: raw/<path>
```

## Step 6 — Next action

Usually `/es-ingest <path>` on the most authoritative result.

## Guardrail

Do not invent DOIs, paper titles, or author lists. If you cannot execute the query, say so and emit only the plan. Generic web search is **last resort**, not first.
