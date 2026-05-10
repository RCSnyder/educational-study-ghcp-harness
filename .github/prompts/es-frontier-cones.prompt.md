---
name: es-frontier-cones
description: List active research cones
argument-hint: "[field]"
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

# FRONTIER CONES

List the major active research or debate cones.

For each cone, return:

## [Cone name]
- One-sentence description
- Core question
- Required tools
- Representative methods
- Entry point
- Frontier problem
- Adjacent fields
- Difficulty: low / medium / high / brutal
- Computational accessibility: low / medium / high
- Source verification needed

Then add:

## Best beginner-adjacent cone
Which cone is most accessible and why.

## Worst beginner trap
Which cone looks tempting but is a poor first target.

## Next action
One trailhead.

