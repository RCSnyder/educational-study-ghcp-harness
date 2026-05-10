---
name: es-atlas
description: Build a reusable academic atlas
argument-hint: "[domain]"
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

# ACADEMIC ATLAS

Build a reusable atlas using the continent / mountain range / trailhead metaphor.

Return:

## Continent
Broad field and scope.

## Mountain ranges
Major subfields, traditions, methods, or research regions.

## Trailheads
Entry points that lead to usable competence.

## Load-bearing fundamentals
Concepts, methods, evidence types, and practice forms that everything depends on.

## Source base
Primary sources, textbooks, reviews, handbooks, syllabi, datasets, cases, official docs, or canonical works needed to ground the map.

## Prerequisite graph
Minimal dependencies and just-in-time dependencies.

## Skill primitives
Core operations experts perform.

## Practice graph
How to develop competence through tasks.

## Frontier graph
Active research/debate directions.

## Rabbit-hole map
What looks important but can wait.

## JSON-like map
Compact reusable structure:

```yaml
domain:
  continent:
  mountain_ranges:
  trailheads:
  core:
  methods:
  evidence:
  sources_needed:
  practice:
  frontiers:
  rabbit_holes:
  next:
```

## Next command
Recommend the next slash command.

