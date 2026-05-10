---
name: es-claimledger
description: Extract and verify claims
argument-hint: "[topic, answer, notes, or previous output]"
agent: 'ask'
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

# CLAIM LEDGER

Extract all major claims and create a verification table.

Return a table:

| Claim | Source needed | Source tier | Source found? | Confidence | Contested? | What would falsify it | Next verification action |
|---|---|---:|---|---|---|---|---|

Then add:

## Highest-risk claims
Claims most likely to be wrong, overconfident, outdated, or misleading.

## Missing sources
Sources needed before relying on this.

## Revised cautious version
Rewrite the answer in a more epistemically safe way.

## Next action
One verification step.

