---
name: es-worked
description: Generate a Sweller-style worked example for a concept, with annotated steps and faded variants
argument-hint: "<concept page> [--difficulty introductory|intermediate|advanced]"
agent: "agent"
---

## Operating contract

Format per [templates/worked-example.md](../../templates/worked-example.md). Cognitive-load research: novices learn faster from worked examples than from unguided practice. Use this for first exposure; switch to `/es-problem` once schema is established.

The annotated solution must trace Pólya's four phases (Understand → Plan → Carry out → Look back) from `docs/reasoning-primitives.md`. The _Look back_ step (Step 5 below) is non-negotiable — a worked example without it teaches imitation, not transfer.

# EDUCATIONAL STUDY — WORKED

## Step 1 — Anchor the concept

- Read the target wiki page.
- Confirm `status: grounded` or at least sufficient sourced material to ground a worked example.
- If the page is too thin, redirect to `/es-deepdive` and stop.

## Step 2 — Pick a representative problem

- Pull one canonical problem from the page's "canonical examples" section, or propose one.
- Confirm with the user before generating the full example.
- Cite the source of the problem (`^[raw/...]` or "[author/agent-generated]").

## Step 3 — Annotated solution

Walk the solution as Pólya's phases, not as a stream of moves:

- **Understand:** unknown, data, condition, restated in plain language. Make this explicit even if it feels obvious — that is the schema.
- **Plan:** the related problem / governing principle that selects the strategy, and one alternative considered and rejected.
- **Carry out:** for each step give:
  - The mathematical / logical / argumentative move.
  - **Why this step:** the cue in the problem that triggered it (one sentence).
  - **Alternative:** what else you could have tried; why this is preferred.
  - **Common error:** the typical novice mistake at this step.

Steps must be granular enough that a novice could follow without filling in invisible moves.

## Step 4 — Sanity checks

At least three:

- Dimensional / type / unit / sign check.
- Limiting case or special case.
- Cross-check via a second method, however cursory.

## Step 5 — Look back (Pólya phase 4, mandatory)

- **Condition check:** does the answer actually satisfy the original condition?
- **Alternative derivation:** sketch (one or two lines) of a different route to the same answer, or state honestly that none is available.
- **Generalization hook:** where else does this method apply? Name 1–2 problem classes or domains the user should now expect to recognize.
- **Limits:** what this example does _not_ prove or extend to. Guard against over-transfer.

## Step 6 — Reusable pattern

3–6 lines of abstracted pattern. This is what gets internalized; the specific numbers do not.

## Step 7 — Faded variants

- Variant 1: same structure, different numbers.
- Variant 2: same structure, one annotated step removed (user must supply that step).
- Transfer variant: a problem from a different topic that uses the same pattern.

## Step 8 — Persist

- Write to `problems/<concept>-worked-<n>.md`.
- Patch the concept page's "canonical examples" section to add a `[[problems/...]]` link (do not rewrite the page).

## Step 9 — Next action

Usually a faded variant under `/es-solve`, or `/es-transfer` once the user wants to test the abstracted pattern.

## Guardrail

A worked example without "common errors" is incomplete. The errors are most of the value — they tell the learner what the schema is **not**.
