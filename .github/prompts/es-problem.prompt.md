---
name: es-problem
description: Analyze a textbook problem without solving immediately
argument-hint: "[paste problem or describe section]"
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

# PROBLEM LENS

Analyze this problem as a learning object. Do not give a full solution unless explicitly asked.

Frame the analysis around Pólya's _Understand_ phase from `docs/reasoning-primitives.md`. The user should leave with the data, unknown, and condition explicitly extracted — that is the artifact. Do not collapse straight into a plan.

Return:

## Problem type
Derivation, computation, proof, conceptual, approximation, boundary value, conservation law, perturbation, dimensional analysis, simulation, source analysis, case brief, essay, critique, etc.

## Understand (Pólya phase 1)
- **Unknown:** what is being asked for.
- **Data:** what is given.
- **Condition:** the constraint linking data to unknown.
- **Restated in plain language:** one sentence, in the user's terms.
- **Sufficiency check:** is the condition enough? Redundant? Contradictory?
- **Have you seen this before?** A near-neighbor problem (cite if possible) — but stop short of executing the analogy.

## What this problem is really testing
Underlying skill.

## Governing principle
Main principle, theorem, equation, method, argument form, doctrine, or framework.

## Minimal toolset
Only tools needed.

## Solution skeleton
3–7 steps without grinding details. (This is _Plan_-phase scaffolding, not _Carry out_.)

## Key decision point
Where students get stuck.

## Reusable pattern
Where this appears elsewhere.

## Prerequisite gaps
If this is hard, what to review.

## Good sign
What it means if the user can solve this cleanly.

