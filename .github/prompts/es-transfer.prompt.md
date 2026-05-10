---
name: es-transfer
description: Construct a transfer problem — same concept, different subfield or surface form
argument-hint: "<concept page> [--target-domain <tag>]"
agent: "agent"
---

## Operating contract

Transfer is the strongest test of understanding: solving a problem that **looks** unrelated but uses the same load-bearing idea. Per [.github/copilot-instructions.md](../../.github/copilot-instructions.md): "transfer the idea to a new case" is part of the orientation demonstration.

# EDUCATIONAL STUDY — TRANSFER

## Step 1 — Identify the load-bearing idea

- Read the concept page. State the underlying pattern in one sentence, stripped of domain-specific vocabulary.
- Confirm the user agrees with the pattern statement before constructing the problem. (If they don't, the user has not yet abstracted the concept; redirect to `/es-explain-back`.)

## Step 2 — Pick a target domain

- `--target-domain` flag, or ask.
- Constraints: the target domain must use the same pattern but live in a **different vocabulary** — different objects, different units, different conventions. Otherwise it is a near-transfer, not a transfer.
- Examples of good cross-domain pairings:
  - Diffusion (physics) ↔ Bayesian updating (stats) ↔ rumor spread (sociology).
  - Eigenvalues (linear algebra) ↔ stationary distributions (Markov chains) ↔ PageRank (CS).
  - Comparative statics (econ) ↔ implicit function theorem (math) ↔ sensitivity analysis (engineering).

## Step 3 — Construct the problem

- Stated entirely in target-domain vocabulary.
- The user must not be told which underlying concept it tests. (That is the test.)
- Difficulty calibrated to the user's prior solo problems on the source domain.
- Cite or generate honestly. If generated, label `[author/agent-generated]`.

## Step 4 — Write the rubric (hidden until user attempts)

- The mapping: target-domain object → source-domain object.
- The expected solution path (in target vocabulary).
- The expected pattern recognition: at what point should the user say "this is just X"?
- Common failures: solving by domain-specific tricks without recognizing the pattern.

## Step 5 — Persist

- `problems/<concept>-transfer-<target-domain>.md`.
- Frontmatter `type: transfer-problem`, `tests: [[concept]]`, `target-domain: <tag>`.

## Step 6 — Score (after user attempts)

- **Pass:** user recognized the pattern and solved correctly.
- **Partial:** solved but did not recognize the pattern, or recognized but could not execute.
- **Fail:** neither.

## Step 7 — Next action

- Pass → promote concept page to `confidence: high`; consider `/es-frontier-cones` for what's next.
- Partial → another transfer in a third domain.
- Fail → `/es-deepdive` on the concept; the abstraction has not landed.

## Guardrail

Do not give hints. Do not gesture toward the source domain. The whole point is unguided pattern recognition. If the user struggles for 20 minutes, that is the test working.
