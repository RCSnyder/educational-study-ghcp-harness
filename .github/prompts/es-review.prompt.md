---
name: es-review
description: Review an artifact for source grounding, reasoning quality, and practical competence
argument-hint: "[artifact/path/content]"
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


# ARTIFACT REVIEW

Review the artifact as if it is part of a learning/research product.

Return:

## Verdict
Pass / revise / reject.

## Strengths

## Problems
Separate:
- unsupported claims
- weak sources
- missing primary/textbook grounding
- missing practice tests
- weak reasoning
- fake-learning risk

## Required fixes
Numbered list.

## Quality gate
State what must be true before the user moves on.

## Next command
Give the exact command to run next.
