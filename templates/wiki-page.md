---
type: concept # concept | entity | source | comparison | overview
tier: 2 # 0 user-provided, 1 primary, 2 authoritative synthesis, 3 teaching, 4 secondary, 5 AI synthesis
confidence: medium # low | medium | high  (tied to tier, not vibes)
status: draft # stub | draft | grounded | stale
updated: YYYY-MM-DD
suggested-by: # artifact, query, or wiki page that surfaced this
  - notes/[topic]-source-pack.md
tags:
  - domain/[domain]
  - subfield/[subfield]
aliases:
  - alternate name
provenance-score: 0 # 0..1; computed by /es-lint as (sourced-claims / total-non-trivial-claims)
time-spent: 0 # minutes invested by the curator on this page (rough; for /es-stats triage)
---

# [Page Title]

> One-sentence definition or scope statement. No hedging. If you cannot write this in one line, the page is not ready to leave `stub`.

## Core claim

The single load-bearing claim of this page. Everything else supports it.

## Evidence

- Claim 1. ^[raw/source-a.pdf:42-58]
- Claim 2. ^[raw/source-b.md:Section 3]
- Claim 3. (Tier 2 — Griffiths _Electrodynamics_ 4e, §3.1, p. 110)

Provenance format:

- `^[raw/...:lines-or-section]` for raw sources in this repo.
- `(Tier N — citation)` for external sources where no raw artifact exists yet.

## Assumptions

What this page takes for granted. Each assumption should link to its own page or be marked `unsourced synthesis`.

## Counterarguments / contested

Where the consensus thins. Each entry names a rival position and at least one source.

## What would falsify or revise this

The empirical, mathematical, or interpretive result that would force a rewrite.

## Connections

- Prerequisite: [[Page A]]
- Builds on: [[Page B]]
- Used by: [[Page C]]
- Compare with: [[Page D]]

## Practice hook

The one drill, problem, or task that proves the reader can use this page, not merely recognize it.

## Open questions

What is still unknown or unverified on this page.

## Provenance trail

- Created: YYYY-MM-DD via `/es-ingest` of `raw/...`
- Last patched: YYYY-MM-DD — reason: ...
- Last audited: YYYY-MM-DD — `/es-audit` result: ...
