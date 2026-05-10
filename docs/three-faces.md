# Three Faces of Educational Study GHCP Harness

Educational Study GHCP Harness is a single substrate (a markdown vault tracked in git) with three operational faces. The faces are **diagnostic categories**, not separate tools. Every command belongs to one face, and the buddy infers which face you are operating in from current repo state.

## Atlas — _map_

**Verb:** map.
**Question:** Where am I in this field, what matters, what can I ignore?
**Mode:** wander. Light commits, no branches, no audits required.
**Lives in:** `wiki/index.md`, `maps/`, frontier-cones, source tiers.
**Commands (representative):** `/es-domain`, `/es-atlas`, `/es-substrate`, `/es-frontier-cones`, `/es-anti-rabbithole`, `/es-goodenough`, `/es-prereqs`.
**Failure it fights:** _learning-shaped entertainment_ — feeling oriented without being oriented. Infinite prerequisite loops. Completionism.
**Typical artifact:** a domain atlas, a list of trailheads, a `notes/<slug>-query.md` goal file.

## Dojo — _train_

**Verb:** train.
**Question:** What can I actually do, where am I weak, what is the next drill?
**Mode:** study. Real commits with provenance. Gaps tracked across sessions. Audits before promoting.
**Lives in:** `problems/`, `notes/gap-ledger.md`, `notes/i-could-be-wrong.md`, `notes/decision-journal.md`, `wiki/concept/*.md` at `status: grounded`.
**Commands (representative):** `/es-problem`, `/es-solve`, `/es-drill`, `/es-worked`, `/es-transfer`, `/es-iwrong`, `/es-explain-back`, `/es-calibrate`, `/es-reach`.
**Failure it fights:** passive fluency. Recognition mistaken for competence. Ingest-without-practice spirals.
**Compounding mechanism:** the **gap ledger**. Each failed problem produces a gap entry; `/es-reach` reads the ledger to propose the smallest drill that closes the highest-leverage gap, alongside the hardest problem you can productively engage _now_. This is the Gowers loop made mechanical: solving slightly-too-hard problems compounds into solving much-harder problems later.

## Forge — _make_

**Verb:** make.
**Question:** What new structure can I produce here that did not exist before?
**Mode:** synth. Branched by default. Adversarial review before merge to `main`.
**Lives in:** `explore/<topic>` branches, `wiki/contradictions.md`, `wiki/steelman/`, hypothesis files, concept invention briefs, transfer briefs, opportunity memos.
**Commands (representative):** `/es-falsify`, `/es-steelman`, `/es-contradiction`, `/es-blend`, `/es-tribal`, `/es-lineage`.
**Failure it fights:** sloppy novelty. Surface analogy. Confident-sounding unsourced synthesis.
**Branch trigger:** Forge work goes on an `explore/<topic>` branch when **any** of:

- it contradicts an existing `grounded` page,
- it introduces a claim that depends on no existing source in `raw/` or `wiki/bib/`,
- it produces a candidate concept (e.g. via `/es-blend`) that has not been adversarially reviewed,
- it requires more than one `/es-falsify` round to settle.

_Stay on `main`_ only when the synthesis is a re-statement, generalization, or simplification that uses **only** sources already cited in pages currently at `status: grounded`, AND the new claim is consistent with every grounded page it touches. When in doubt, branch.

## How the buddy uses these faces

`/es-buddy` reads:

- recent `git log` (what was committed, when)
- presence/absence of an active goal in `notes/*-query.md` with `status: active`
- presence of `notes/gap-ledger.md` entries
- staged-but-uncommitted changes
- the user's current question

…and returns a diagnosis of which face you are in, the lightest appropriate next move, and (when warranted) a suggestion to escalate or de-escalate.

The buddy will refuse to nag in Atlas mode. It will only propose commits in Dojo and Forge.

## What gets cited where

| Source tier                    | Atlas           | Dojo                    | Forge                           |
| ------------------------------ | --------------- | ----------------------- | ------------------------------- |
| Tier 0 (your `raw/`)           | optional        | required at claim level | required at claim level         |
| Tier 1 (primary)               | optional        | preferred               | required for grounded promotion |
| Tier 2 (synthesis)             | optional        | acceptable              | acceptable                      |
| Tier 3–4 (teaching, secondary) | useful          | label as such           | not load-bearing                |
| Tier 5 (AI)                    | hypothesis only | hypothesis only         | hypothesis only                 |

## What is _not_ a separate face

Three things the design deliberately does **not** elevate to a face:

- **Publishing / sharing.** A public github repo is the share layer. `/es-snapshot` tags a citable position; `/es-export` bundles for offline reading; further publishing-shape commands (essay, thread, talk, paper) are deferred to Wave 2 of the implementation.
- **Source curation.** `raw/` and `wiki/bib/` are inputs to all three faces, not their own face.
- **Multi-user collaboration.** Single-user is the right scope. Branches + standard github fork/PR + issues handle realistic collaboration. The vault is the message; the conversation lives in github issues outside the vault.

## Mirror as monastic discipline, not a fourth face

Periodic re-examination of grounded claims (drift checks, calibration review, stale-promotion sweeps) is a **scheduled** mode of the existing faces, not a separate face. It runs through `/es-calibrate`, `/es-stats`, `/es-tribal --sweep`, and (future) `/es-revisit`. The buddy may surface "the monastery is overdue" when ratios drift.
