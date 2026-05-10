---
type: hypothesis
status: open # open | confirmed | refuted | morphed
opened: YYYY-MM-DD
last-checked: YYYY-MM-DD
branch: explore/<topic>
parent-sha: <full sha of main at branch creation>
parent-tag: "" # optional snap/... tag if branched from a snapshot
falsified-by: "" # commit sha that demolished this, if refuted
sources-at-branch:
  - "" # ^[raw/...] anchors and [@cite-keys] available when hypothesis was opened
suggested-by:
  - "" # what triggered this — a /es-blend, a contradiction, a paper, etc.
tags:
  - hypothesis
---

# Hypothesis: <one-line statement, verbatim>

## What I am claiming

<2–4 sentences. The claim, as crisp as possible. If you cannot state it crisply, the hypothesis is not yet ready to branch.>

## Why this is on a branch and not on `main`

Forge work goes on a branch when it (a) contradicts an existing `grounded` page, or (b) introduces a claim with no Tier 0–2 source yet. State which condition applies.

## What would confirm this

Concrete, falsifiable. "X would be true if I look" not "people would agree with me."

## What would refute this

Equally concrete. If you cannot name a refutation, the hypothesis is not falsifiable and should be re-stated.

## Predictions

What does this hypothesis license that the prior position did not?

- Prediction 1:
- Prediction 2:

## Sources at branch

(Mirrors the frontmatter `sources-at-branch:` for narrative context.)

## Adversarial review log

When `/es-falsify` runs against this hypothesis, append the result here:

- [YYYY-MM-DD] `/es-falsify` — <pass | partial | fail>. <one-line summary>. See `wiki/reports/<filename>.md`.

## Resolution

When the hypothesis resolves (`status: confirmed | refuted | morphed`), append a closing entry:

- **Date:**
- **Resolution:**
- **Evidence:**
- **Commit that records resolution:** <sha>

If `confirmed`: merge branch to `main` via `audit(<topic>): promote hypothesis to grounded` commit.
If `refuted`: merge branch to `main` via `iwrong(<topic>): refuted hypothesis preserved` commit. **Do not delete the branch.** Per AGENTS.md, failed experiments stay in the log.
If `morphed`: explain what the hypothesis became, link to the new hypothesis file, and resolve the original as `morphed`.
