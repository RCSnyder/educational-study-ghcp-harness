---
name: es-prereqs
description: Find real prerequisites
argument-hint: "[topic] for [goal/background]"
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

# PREREQUISITE GRAPH

Find the true prerequisite stack. Prevent fake prerequisite loops.

Return:

## Target
Topic and goal.

## Minimal prerequisites
Truly needed to begin.

## Just-in-time prerequisites
Learn when encountered.

## Fake prerequisites
Things people overemphasize too early.

## Dependency graph
current skill -> missing tool -> target topic

## Diagnostic questions
5–10 readiness checks.

## Fast path
Shortest responsible route.

## Deep path
Long-term mastery route.

## Stop condition
When the user can start.

## Next action
One prerequisite task.

