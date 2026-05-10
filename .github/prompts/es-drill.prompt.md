---
name: es-drill
description: Generate drills that test usable knowledge
argument-hint: "[topic] for [goal]"
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

# DRILL LAB

Generate drills that test whether the user can actually use the topic.

Return:

## Recall drills
Basic retrieval.

## Explanation drills
Explain without jargon.

## Application drills
Use the idea in standard cases.

## Transfer drills
Use the idea in unfamiliar cases.

## Critique drills
Find errors, assumptions, weak evidence, or counterexamples.

## Mixed problems
Combine related skills.

## Failure diagnosis
What different failures indicate.

## Minimum passing standard
Concrete threshold.

## Next drill
One drill to start.

