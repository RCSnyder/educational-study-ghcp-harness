---
name: es-stats
description: Corpus health dashboard — wiki composition, drift, gaps, and load-bearing thinness
argument-hint: "[--report]"
agent: "agent"
---

## Operating contract

Read-only sweep of the vault. Produces a one-shot dashboard. With `--report`, also writes to `wiki/reports/stats-<YYYY-MM-DD>.md`.

# EDUCATIONAL STUDY — STATS

## Step 1 — Composition

Counts:

- Total wiki pages by `type:` (entity, concept, source, comparison, marginalia, theorem, case, experiment, source-reading, ...).
- Total by `status:` (draft, grounded, contested, stale).
- Total by `tier:` (0–5).
- Total by top-level `tags:` namespace (`domain/...`, `subfield/...`, `school/...`).

## Step 2 — Provenance density

- Pages with zero `^[raw/...]` anchors and `status: grounded` → **listed**, not summarized. These are the most dangerous pages in the vault.
- Average anchors per grounded page.
- `[@cite]` references vs `wiki/bib/` entries — gap surfaced.

## Step 3 — Drift indicators

- Pages where `status: grounded` and `last-edited:` > 6 months ago — candidates for `/es-update-atlas`.
- Source pages with `replication-status: failed-replication` or `retracted: true` whose dependents have not been demoted.
- Pages with `confidence: high` that have never had a `/es-falsify` audit (no `wiki/reports/<page>-falsify.md`).

## Step 4 — Practice / consumption ratio

Read `wiki/log.md`:

- Count `ingest`, `update-atlas` events (consumption).
- Count `practice`, `drill`, `solve`, `explain-back`, `transfer` events (production).
- Ratio. Per AGENTS.md: "Wiki growth without practice is failure." Surface the ratio explicitly.

## Step 5 — Tribal exposure

- Number of `confidence: high` claims with single-source provenance (count, not enumeration).
- Pointer to last `/es-tribal` report. If none in last 30 days, recommend running it.

## Step 6 — Goal alignment

- Active goals from `notes/<slug>-query.md` files.
- For each, list count of pages tagged in scope vs total pages touched since the goal opened. Goal drift surfaces here.

## Step 7 — Top concerns (3 bullet points)

The single most actionable thing the dashboard reveals. Examples:

- "12 grounded pages have zero `^[raw/...]` anchors. Run `/es-audit` on each."
- "Practice/consumption ratio is 0.1. You are accumulating, not learning."
- "3 source pages have failed replications; 14 dependent pages still claim `confidence: high`. Cascade the demotion."

## Step 8 — Persist (if `--report`)

Write to `wiki/reports/stats-<YYYY-MM-DD>.md`. Append a one-liner to `wiki/log.md`.

## Step 9 — Next action

The first item from Top concerns.

## Guardrail

This command must never be run as theatre. If the dashboard reads "everything is fine," look harder; either the vault is small or the lint rules are too lax.
