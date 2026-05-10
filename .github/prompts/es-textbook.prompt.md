---
name: es-textbook
description: Extract critical core from a textbook section
argument-hint: "[book/chapter/section]"
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

# TEXTBOOK CORE EXTRACTION

Analyze this textbook section as a training module. If the text is not supplied, state what you can infer and what needs the actual text.

Return:

## Chapter thesis
What this section is trying to teach.

## New objects introduced
Definitions, intuitions, why introduced, later use.

## New equations/models/arguments/frameworks
For each:
- what it says
- assumptions
- what problems it solves
- central or secondary

## Problem taxonomy
End-of-chapter or practice problem types.

## Critical path
Minimum sequence of concepts/problems.

## Skip/defer list
Optional first-pass material.

## Mastery checks
Diagnostic questions/problems.

## Bridge forward
What future topics this unlocks.

## Source grounding
How to verify this against the textbook.

## Study prescription
Read order, problem order, solution-check timing, move-on point.

