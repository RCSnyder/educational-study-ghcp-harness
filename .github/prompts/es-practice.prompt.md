---
name: es-practice
description: Generate competence-building practice
argument-hint: "[topic] at [level]"
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

# PRACTICE SET

Generate practice tasks that build real competence.

Return:

## Level
State assumed level.

## Practice tasks
10 tasks. For each:
- task
- what it trains
- method used
- what a good answer/solution contains
- common mistake
- what to review if failed

## Transfer tasks
3 tasks requiring use in a new context.

## Critique task
1 task requiring evaluation of a claim, source, argument, method, or solution.

## Minimum passing standard
What counts as good enough.

## Next action
Which task to do first.

