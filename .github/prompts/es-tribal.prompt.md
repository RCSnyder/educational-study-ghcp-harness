---
name: es-tribal
description: Detect single-source folklore — claims repeated across the wiki without independent corroboration
argument-hint: "[--page <page>] [--all]"
agent: "agent"
---

## Operating contract

Tribal knowledge = a claim that appears in multiple wiki pages but traces back to a single source (or no source). Erudite literature is full of these; they propagate by citation laundering. This command surfaces them.

# EDUCATIONAL STUDY — TRIBAL

## Step 1 — Scope

- `--page <page>`: audit one page's claims.
- `--all`: full-vault sweep (slower).
- Default: claims marked `confidence: high` across all grounded pages.

## Step 2 — Build the claim → source map

For each non-trivial claim in scope:

- Extract the claim (one sentence).
- List all `^[raw/...]` and `[@cite]` provenance markers.
- Distinct underlying sources count = N.

## Step 3 — Flag tribals

A claim is **tribal** if any of:

- N = 0 (no source; pure folklore).
- N = 1 across multiple pages (single-source repetition presented as consensus).
- All N sources are themselves citing the same upstream source (citation laundering — trace the chain).
- All N sources are `tier: 4` or `tier: 5` (no primary or authoritative anchor).

## Step 4 — For each tribal claim

Output:

- The claim (verbatim).
- Pages that assert it.
- Apparent source count vs actual independent source count.
- Citation chain if laundering is involved.
- Verdict: `unsourced | single-source | laundered | low-tier-only`.

## Step 5 — Recommended remedies

- `unsourced` → `/es-fetch <claim>` to find a primary source, or downgrade `confidence:`.
- `single-source` → either find an independent corroborating source or rewrite as "X argues Y" (attributed) instead of "Y" (asserted).
- `laundered` → patch all downstream pages to cite the upstream source directly; flag the laundering chain.
- `low-tier-only` → mark `confidence: low` and add to `wiki/reports/tribal-<date>.md`.

## Step 6 — Write the report

`wiki/reports/tribal-<YYYY-MM-DD>.md` with the full list and remedies.

## Step 7 — Next action

Usually `/es-fetch` on the highest-stakes tribal claim, or `/es-audit` if multiple pages are affected.

## Guardrail

Citation laundering is the single most underdiagnosed failure in academic notes. Be paranoid. If a claim is "well-known," ask why and whose words it repeats.
