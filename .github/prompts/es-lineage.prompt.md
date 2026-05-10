---
name: es-lineage
description: Build or extend an intellectual-genealogy block on a thinker / school / movement page
argument-hint: "<entity-page>"
agent: "agent"
---

## Operating contract

Format per [templates/lineage.md](../../templates/lineage.md). Lineage is a separate graph from the concept graph — it tracks **who read whom**, **who taught whom**, **who broke with whom**. Per the field-layers doc, this is core scaffolding for humanities and history-of-science work.

# EDUCATIONAL STUDY — LINEAGE

## Step 1 — Locate the entity

- Confirm `wiki/entity/<thinker>.md` exists with `sub-type: thinker`, `school`, or `movement`.
- Read existing lineage block (if any). We patch, never rewrite.

## Step 2 — Build the four edge sets

Walk through each, citing every edge:

1. **Teachers / formative influences** — doctoral advisor, primary mentor, dominant influence by deep reading.
2. **Students / direct heirs** — doctoral students, named successors.
3. **Read by / drew on** — works actually engaged (cite the engagement in [@cite] form). Distinguish "cited but not engaged" from "engaged with."
4. **Broke with** — the documented break. Cite the published moment of break.

Each edge needs at least one of:

- A `^[raw/...]` provenance pointer (a published acknowledgment, dedication, refutation).
- A `[@cite]` to a biography or intellectual history.

If you cannot cite, the edge is **folklore**; route it to `/es-tribal` instead.

## Step 3 — Mistaken associations

The most valuable section. Common attributions or "X-ian" labels that the historical record does not support, with the corrective citation. Examples:

- "Often called Y-ian; actually disagreed with Y on **\_** (cite)."
- "Often paired with [[Z]]; no documented engagement (verified by sweep of corpus)."

## Step 4 — Lineage notes

One paragraph: the load-bearing observation about how this thinker fits into the field's history. The thing that, if a student missed, would make them misread every later treatment.

## Step 5 — Patch the page

- Insert / extend the `## Intellectual lineage` section.
- Update frontmatter: `lineage-edges: <count>`, `last-lineage-update: <date>`.
- Status of the page does not change unless contradictions are surfaced (then run `/es-contradiction`).

## Step 6 — Log

```text
## [YYYY-MM-DD] lineage | <entity>
- Edges added: <count>
- Mistaken associations corrected: <count>
```

## Step 7 — Next action

- If many edges added: `/es-graph path <thinker> <other>` to visualize.
- If mistaken associations were heavy: `/es-tribal --all` to find similar laundering across the vault.

## Guardrail

Direction matters. "Drew on" ≠ "broke with" ≠ "extended." Refuse to record an edge with an underspecified type.
