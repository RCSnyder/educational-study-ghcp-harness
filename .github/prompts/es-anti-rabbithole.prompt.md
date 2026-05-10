---
name: es-anti-rabbithole
description: Decide whether a topic is overstudying
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

# RABBIT-HOLE CHECK

Determine whether the user is overstudying this topic for the stated goal.

Return:

## Goal relevance
Essential / useful / optional / specialist / distraction.

## What is actually needed
Minimal subset.

## What can be ignored for now
Safe deferrals.

## What only specialists need
Deep areas not needed yet.

## Risk of premature dismissal
Check whether the topic is actually foundational despite feeling broad.

## Warning signs
Signs of procrastination by sophistication.

## Replacement action
A more direct task.

## Move-on criterion
Concrete stopping point.

