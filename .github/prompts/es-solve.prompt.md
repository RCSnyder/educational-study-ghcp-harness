---
name: es-solve
description: Solve a problem and extract reusable method
argument-hint: "[paste problem + optional attempt]"
agent: "ask"
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

# SOLUTION

Solve the problem while preserving learning transfer. **Follow Pólya's four-phase scaffold from `docs/reasoning-primitives.md` (Understand → Plan → Carry out → Look back).** Do not skip _Understand_ or _Look back_ — those are the two phases LLMs habitually omit, and they are mandatory here.

If the user pasted an attempt, critique it phase-by-phase against the same scaffold before producing your own.

Return:

## Classification

Problem type.

## Understand

- **Unknown:** what is being asked for.
- **Data:** what is given (variables, sources, facts, prior results).
- **Condition:** the constraint linking data to unknown.
- **Restated:** the problem in your own words, one sentence.
- **Sufficiency:** is the condition enough to determine the unknown? Redundant? Contradictory?

## Plan

- **Related problem:** a problem you have seen with the same structure (cite if possible).
- **Strategy:** the principle, theorem, doctrine, or method to apply.
- **Why this strategy:** the cue in the problem that selects it.
- **Alternative considered and rejected:** one alternative and why this one wins.

## Core idea

The one idea that unlocks it.

## Setup

Variables, assumptions, coordinates, terms, source context, signs, facts, rules, or equations.

## Carry out

Step-by-step derivation/analysis. Each load-bearing step justified. Do not skip.

## Look back

Mandatory. Use applicable checks:

- units / dimensions / type
- limiting / boundary / special cases
- sign / symmetry
- conservation / consistency
- counterexample
- source consistency
- legal / factual / jurisdictional consistency
- statistical identification
- alternative derivation (even cursory)
- **Where else does this method apply?**
- **What does this not prove?**

## Reusable template

Abstract the method.

## Similar problems

Nearby problem types.

## What to review if hard

Targeted review only.

## Next problem

A related exercise.
