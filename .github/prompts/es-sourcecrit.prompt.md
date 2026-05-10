---
name: es-sourcecrit
description: Critically analyze a source
argument-hint: "[source/text/paper/case/dataset]"
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

# SOURCE CRITIQUE

Analyze this source critically.

Return:

## Source type
Primary, secondary, textbook, review, dataset, case, article, etc.

## Context
Author/institution, date, purpose, audience, historical/scientific/legal context.

## Main claim
What it argues or provides.

## Evidence used
What supports the claim.

## Method
How the source produces knowledge.

## Assumptions
Explicit and implicit.

## Biases/incentives
Possible limitations.

## What it can prove
Responsible uses.

## What it cannot prove
Overreach warnings.

## Corroboration
What sources should check it.

## Expert use
How a competent scholar/practitioner would use it.

## Claim ledger
Key claims and verification needs.

