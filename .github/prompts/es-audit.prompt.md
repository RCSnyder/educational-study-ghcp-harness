---
name: es-audit
description: Audit for hallucination and fake confidence
argument-hint: "[map/claim/plan/topic/previous answer]"
agent: "ask"
---

## Operating contract

Use the user's arguments after the slash command as the target. If the target is ambiguous, make a reasonable assumption and label it.

Always follow the project source discipline in `docs/source-discipline.md`:

- Separate sourced fact, expert consensus, contested interpretation, pedagogical simplification, speculative synthesis, and unknown.
- Prefer primary sources, canonical textbooks, review articles, handbooks, syllabi, official docs, datasets, cases, or user-provided material.
- Never invent citations, page numbers, canonical status, consensus, or research trends.
- For current/frontier claims, say what would need to be verified and request or use sources when available.
- End with one concrete next action.

Do not merely make the user feel oriented. Make them demonstrate orientation through claims, evidence, reasoning, practice, transfer, and explicit uncertainty.

# AUDIT

Audit this for hallucination risk, false confidence, weak sourcing, weak reasoning, and illusion of learning.

Return:

## Strong parts

What is structurally useful.

## Weak parts

Where the map/claim/plan might fail.

## Unsupported claims

Claims that need sources.

## Overconfident claims

Claims stated too strongly.

## Missing primary sources

What Tier 1 sources are needed?

## Missing textbook/handbook grounding

What Tier 2 sources are needed?

## Missing counterarguments

What rival interpretations or objections are missing?

## Missing practice tests

What tasks would prove actual competence?

## Illusion-of-learning risks

Where this could make the user feel competent without being competent.

## Hardened revision

Rewrite the plan/map/claim with uncertainty labels and source requirements.

## Verification gate (math, theory, formal-systems pages)

If the audited page has `formalizable: true` (theorems, proofs, problem solutions, algorithm-correctness claims), apply the **promotion gate** from [`verify/README.md`](../../es-verify/README.md):

- **Refuse** to approve `status: draft → grounded` unless one of:
  1. `verification.method` ∈ {`lean`, `tlaplus`, `python-test`, `python-numeric`, `sympy`} **and** `verification.last-result: pass` **and** `last-run` is within 90 days **and** newer than the artifact mtime; or
  2. `verification.method: manual` with non-empty `notes:` justifying why automation is infeasible, **and** the promotion commit body contains `Manually re-verified by <name> on YYYY-MM-DD`.

If the page is `formalizable: false`, the gate is waived **but** the audit must record why in this report (one line: "Exempt: <reason>").

If the gate fails, do not propose promotion. Recommend `/es-verify <slug>` and stop.

## Next verification action

One concrete action.
