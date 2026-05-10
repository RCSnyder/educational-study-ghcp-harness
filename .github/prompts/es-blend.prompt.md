---
name: es-blend
description: Forge command. Conceptual blending — produces a new concept by aligning two input spaces, projecting selectively, and surfacing emergent structure. Branched by default. Inspired by Fauconnier & Turner.
argument-hint: "<input-A> + <input-B>"
agent: "agent"
---

## Operating contract

`/es-blend` is a **Forge** operation. It produces structured candidate concepts by conceptual blending — not free-association, not vague analogy. The intellectual lineage is Fauconnier & Turner (conceptual integration networks) and Gentner (structure-mapping). See [`docs/three-faces.md`](../../docs/three-faces.md) for face semantics.

Because blending generates novel claims that have **no Tier 0–2 source by definition**, this command **branches by default**. Forge work that contradicts grounded pages or introduces unsourced novel structure must live on `explore/<topic>` until adversarial review (`/es-falsify`, `/es-audit`) decides whether it merges to `main` or is recorded as a learned dead end.

Use when:

- you want to combine two domains, frameworks, or models to see what emergent structure appears,
- you are looking for a new concept (not a summary of existing ones),
- you have a hunch that two things share deep structure and you want to test it before committing.

# EDUCATIONAL STUDY — BLEND

## Step 0 — Confirm branch posture

Before producing any artifact:

1. Check current branch with `git branch --show-current`.
2. If the current branch is already `explore/blend-<existing-slug>`, **check the existing hypothesis file's resolution status** (`notes/blend-<existing-slug>-hypothesis.md`):
   - If `status: open` — refuse to start a fresh blend on the same branch. The current hypothesis must be resolved (`confirmed | refuted | morphed`) and merged back to `main` (per the non-destructive history rule, refuted hypotheses merge as `iwrong(...)` commits) before a new blend begins. Tell the user to run `/es-falsify` on the open hypothesis, or to checkout `main` and start a new branch for the new blend.
   - If `status: confirmed | refuted | morphed` but the branch is not yet merged — refuse and tell the user to merge first.
3. If on `main`, propose: `git checkout -b explore/blend-<slug>` where `<slug>` = first 30 chars of `<input-A>-<input-B>` kebab-cased.
4. Refuse to write blend artifacts on `main` unless the user explicitly overrides with "stay on main."

## Step 1 — Parse inputs and confirm

Parse the user's argument as `<input-A> + <input-B>`. If the user supplies only one input or the inputs are ambiguous, ask one disambiguation question. Do not guess.

## Step 2 — Build the blend anatomy

Per Fauconnier & Turner's conceptual integration network, produce:

```markdown
## Input space A: <name>

- core objects:
- key relations:
- governing constraints:
- representative examples:
- source(s) — if any in `wiki/` or `raw/`:

## Input space B: <name>

(same structure)

## Generic space (shared abstract frame)

What relational structure do A and B both instantiate? State the **invariant**. If the generic space is forced or vacuous ("both are systems"), report this and stop — the blend will not be productive.

## Cross-space mappings (counterpart relations)

| A element | B element | Mapped relation |
| --------- | --------- | --------------- |
| ...       | ...       | ...             |

## Selective projection

What from A enters the blend? What is left out? What from B enters? What is left out? Be explicit; selective projection is where the blend gains coherence.

## Composition

Once projected elements are in the blend, how do they relate to each other? (Some relations come from A, some from B, some emerge.)

## Completion

What background knowledge fills gaps in the blend? Be explicit — this is where unstated assumptions live.

## Elaboration (mental simulation)

Run the blend forward. What does it predict? What does it license that neither A nor B alone does?

## Emergent structure

Name the **new structure** that exists in the blend but in neither input alone. If there is no emergent structure, report this and stop — you have produced a metaphor, not a blend.

## Backward projection

What does the blend, once elaborated, change about how you think of A or B? (Often the most valuable output.)
```

## Step 3 — Stress-test the blend

```markdown
## Coherence check

- Does the blend hold together as a single mental model, or does it fragment under elaboration?
- What internal contradiction would collapse it?

## Usefulness check

- What new question does this blend let you ask?
- What experiment, derivation, design, or claim does it enable?
- What would falsify the emergent structure?

## Failure modes

- Where does the blend break if pushed?
- What surface similarity is being mistaken for deep structure?
```

If coherence or usefulness fails, **report the failure and stop**. A blend that collapses is a successful Forge operation — it is a recorded dead end. Do not paper over it.

## Step 4 — Name the candidate concept (only if blend survives stress-test)

```markdown
## Candidate concept: <name>

**One-line definition:**
**Mechanism:**
**Source domains:** <input A>, <input B>
**Examples:**
**Non-examples:**
**Failure modes:** (from stress-test)
**Tests / falsifiers:**
**Status:** speculative — requires `/es-falsify` and `/es-audit` before any promotion to grounded.
```

Use [`templates/concept-card.md`](../../templates/concept-card.md) if it exists, otherwise inline the structure above.

## Step 5 — Write the hypothesis file

Write `notes/blend-<slug>-hypothesis.md` from [`templates/hypothesis.md`](../../templates/hypothesis.md). Frontmatter must include `status: open`, the verbatim hypothesis statement, and `parent-sha` = the sha of `main` at branch creation.

## Step 6 — Propose the commit

```
forge(blend-<slug>): candidate concept <name> from <A> + <B>

Inputs: <A> [optional source anchors], <B> [optional source anchors]
Generic-space invariant: <one-line>
Emergent structure: <one-line>
Coherence: <pass | partial | fail>
Falsifiers: <list>

Status: speculative, on branch explore/blend-<slug>. Requires /es-falsify and /es-audit before merge to main.
```

Confidence: low (default for fresh blends). Only escalate to medium/high if the blend is supported by Tier 1–2 evidence already in the vault.

## Step 7 — Tell the user the next step

The next step is **never** "publish this." It is one of:

- `/es-falsify notes/blend-<slug>-hypothesis.md` — adversarial review.
- `/es-transfer <emergent-structure> to <new-domain>` — test portability.
- `/es-contradiction` — does this conflict with any grounded page? Register it.
- `/es-iwrong` — what about this could be wrong?

Only after `/es-falsify` and `/es-audit` survive is merge-to-`main` even on the table.

## Hard rules

- Never claim a blend is "novel research" without external review. The blend is a candidate; the substrate records that the author considered it on a given date.
- Never delete a failed blend branch. Merge it to `main` with an `iwrong(blend-<slug>): ...` commit so the dead end is preserved (per AGENTS.md non-destructive history rule).
