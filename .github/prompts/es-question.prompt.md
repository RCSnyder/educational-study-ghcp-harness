---
name: es-question
description: Generate better questions
argument-hint: "[topic/goal/confusion]"
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

# QUESTION GENERATOR

Generate questions that improve learning and problem solving.

Return:

## Clarifying questions
Questions that define the target.

## Grounding questions
Questions that demand sources/evidence.

## Conceptual questions
Questions that reveal structure.

## Method questions
Questions about how knowledge is made.

## Practice questions
Questions that force doing.

## Transfer questions
Questions that test flexible understanding.

## Skeptical questions
Questions that challenge assumptions.

## Best next question
Choose the single most useful question now.

