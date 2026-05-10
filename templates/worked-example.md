# Worked Example

Cognitive load research (Sweller and successors) shows worked examples beat unguided practice problems for novices. RA defaults to problem-first; for genuinely new material, do a worked example pass first.

## Format

```markdown
---
type: worked-example
concept: [[Page]]
difficulty: introductory | intermediate | advanced
prerequisites:
  - [[Page]]
---

# Worked Example: <name>

## Problem statement

<exact problem, no editing>

## What this example teaches

- Concept 1
- Concept 2 (the load-bearing one)
- Standard move 1
- Standard move 2

## Solution — annotated

### Step 1 — <name of move>

<work>

> **Why this step:** <one sentence; what cue in the problem triggered this move>
> **Alternative:** <what else could you have tried; why this is preferred>
> **Common error:** <what most learners do wrong here>

### Step 2 — <name of move>

<work>

> **Why this step:** ...
> **Common error:** ...

### Step 3 — ...

## Result

<final answer>

## Sanity checks

- Dimensional / type / unit check: ...
- Limiting case: ...
- Special case: ...

## Reusable pattern extracted

<3–6 lines abstracted from this specific problem; this is what you internalize>

## Now you try

- Faded variant 1: <same structure, different numbers>
- Faded variant 2: <same structure, one step removed>
- Transfer: <a problem from a different topic that uses the same pattern>
```

## When to use this template

- First exposure to a new technique.
- Topics where you can solve isolated problems but cannot recognize when to apply them.
- Bridging from textbook chapter to problem set.

## When not to use it

- After you have already solved 3+ problems of the type. Worked examples lose value once you have a working schema.
- For interpretive/humanities work; use [source-position.md](source-position.md) instead.

The pairing pattern: worked example → faded variant → solo problem → transfer. Each step moves further from scaffold to autonomy.
