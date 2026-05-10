---
name: es-rank
description: Rank topics by usefulness for a goal
argument-hint: "[topics] by usefulness for [goal]"
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

# RANKING

Rank topics by usefulness for the stated goal.

For each topic, score 1–5:
- Relevance
- Prerequisite importance
- Difficulty
- Time cost
- Deferrability
- Research/problem-solving value
- Computational/practical accessibility if relevant

Return:

## Ranking table
Scores and rationale.

## Ordered learning path
What to learn first.

## What to skip/defer
Why.

## Risks
Where the ranking could be wrong.

## Source grounding needed
What would verify this ranking.

## Next action
One topic and one task.

