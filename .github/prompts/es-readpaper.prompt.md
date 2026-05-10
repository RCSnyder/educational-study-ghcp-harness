---
name: es-readpaper
description: Analyze a specific paper or source
argument-hint: "[paper title, DOI, arXiv link, pasted abstract, source text]"
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

# PAPER / SOURCE READING

Analyze the supplied source. If only a title or abstract is supplied, do not overclaim beyond it.

Return:

## Field and subfield
Where it belongs.

## Main question
What problem it addresses.

## Main claim
What it claims or contributes.

## Method
How it argues, proves, measures, simulates, interprets, or analyzes.

## Evidence
What supports it.

## Assumptions
Explicit and implicit.

## Required background
What the reader needs.

## Key concepts/equations/arguments
Load-bearing pieces.

## Limitations
Weaknesses, scope conditions, open issues.

## Connection to atlas
Where it sits in the research universe.

## Before / after reading
What to read before and after.

## Claim ledger
Claims made and source confidence.

