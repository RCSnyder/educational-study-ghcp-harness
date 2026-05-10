---
name: es-reach
description: Dojo command. Reads the gap ledger and proposes (a) the smallest drill that closes the highest-leverage gap, and (b) the hardest problem you can productively engage *now*. The Gowers loop.
argument-hint: "[topic or goal slug, optional]"
agent: "agent"
---

## Operating contract

`/es-reach` is the Dojo's **compounding mechanism**. Tim Gowers' observation is that people who solve hard problems tend to solve harder problems — capacity transfers because each hard problem enlarges the analogy space available for the next one. This command operationalizes that loop:

- it reads `notes/gap-ledger.md` to find the gap most likely to be blocking your next problem,
- it proposes the **smallest drill** that addresses that gap (not a survey, not a reading list — a single concrete drill),
- it also proposes the **hardest problem you can productively engage today** with what you currently have, even if related foundations are incomplete,
- it refuses to wait for full prerequisites. Spiral learning, not linear completion.

Use after: a failed problem, a `/es-iwrong` entry, an `/es-explain-back` that exposed gaps, or whenever you don't know what to practice next.

# EDUCATIONAL STUDY — REACH

## Step 1 — Read the substrate

1. `notes/gap-ledger.md` (required input — if missing, propose creating one from `templates/gap-ledger.md` and stop).
2. The active goal (`notes/*-query.md` with `status: active`).
3. Recent `problems/` entries (last 5 by mtime).
4. `wiki/concept/` pages relevant to the topic argument or active goal.

## Step 2 — Classify the user's gaps

For each open gap-ledger entry, classify into one of:

- **must-know-now** — directly blocks the next problem the user wants to solve.
- **learn-just-in-time** — useful but can be deferred until a problem demands it.
- **specialist depth** — only matters if the user pivots into the subfield.
- **fake prerequisite** — the user _thinks_ it blocks them but it does not.
- **rabbit hole** — interesting but unrelated to the goal.

Be explicit about the classification. Use the philosophy doc's terminology (see [`docs/research-atlas-philosophy.md`](../../docs/research-atlas-philosophy.md) §9 and §23).

## Step 3 — Propose two artifacts

### A. Smallest drill that closes the highest-leverage gap

```markdown
## Drill: <gap-title>

**Closes gap:** <gap-ledger entry>
**Time-box:** <minutes>
**Form:** <single-problem | derivation | reconstruction | counterexample-hunt | proof-step>
**Success criterion:** <what done looks like; falsifiable>
**Sources required:** <Tier 0/1/2 anchors>
**If this drill fails:** <next sub-drill, or escalate to /es-worked for an annotated example>
```

The drill should be solvable in one sitting. Multi-week study plans are _not_ drills; reject the temptation to expand scope.

### B. Hardest reachable problem _now_

```markdown
## Reach problem: <name>

**Why this is reachable now:** <which grounded knowledge supports it>
**Why this is at the edge:** <which gaps make it non-trivial>
**What you'll learn whether you succeed or fail:** <expected gap-ledger updates>
**Stop condition:** <when to declare attempt complete, success or failure>
```

The reach problem may use foundations the user has not fully grounded yet. That is intentional. **The point is to surface gaps by attempting real work, not to be safe.**

## Step 4 — Update the gap ledger after the user attempts

Remind the user: after attempting either artifact, run `/es-iwrong` to capture new gaps, and append to `notes/gap-ledger.md` directly for any concrete weakness exposed.

## Step 5 — Propose the commit

If the user has agreed to the drill / reach problem and you are creating files in `problems/`:

```
practice(<topic>): drill <gap-title> + reach <problem-name>
```

If you are only producing the recommendation in chat (no files yet), no commit is proposed.

## Anti-pattern: do not generate a roadmap

`/es-reach` is **not** `/es-roadmap`. Do not produce phased plans, week-1/week-2/week-3 schedules, or curricula. One drill, one reach problem, that's it. The user runs the loop again next session. This is what makes it compound — repeated short cycles, not big plans.
