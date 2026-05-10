---
name: es-rigor
description: Select a source/practice rigor profile for the current task
argument-hint: "[lean|standard|thorough|exhaustive|custom]"
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


# RIGOR PROFILE

Set the rigor level for this session. Since prompt files are not stateful, output a compact profile block the user can paste into future requests.

Profiles:

## lean
Use for orientation. Source-label major claims, but do not overbuild citations. Always include uncertainty labels and one diagnostic task.

## standard
Use for normal learning. Require source tiers for core claims, a short claim ledger, and practice tasks.

## thorough
Use for serious study. Require source grounding, counterarguments, claim ledger, diagnostic drills, and transfer tasks.

## exhaustive
Use for research or high-stakes learning. Require primary/textbook/review source triangulation, competing interpretations, source limitations, and explicit falsification tests.

Return:

## Selected profile

## Rules to apply

## Required outputs

## What this profile prevents

## Copyable context block
A concise block the user can paste into later commands.
