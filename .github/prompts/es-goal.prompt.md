---
name: es-goal
description: Pin the user's verbatim research goal as canonical query (gospel) so all later steps re-read it
argument-hint: "<verbatim goal as user phrased it>"
agent: "agent"
---

## Operating contract

Per [AGENTS.md](../../AGENTS.md): "Canonical query as gospel." The user's stated goal is persisted **verbatim** to a markdown file and re-read on every subsequent step. Drift away from the goal is the single most common failure mode of long agentic sessions.

# EDUCATIONAL STUDY — GOAL

## Step 1 — Capture verbatim

- Write the user's goal to `notes/<slug>-query.md` exactly as stated. No paraphrase, no "improvement."
- Slug = first 40 chars of goal, kebab-cased.

## Step 2 — Frontmatter

```yaml
---
type: canonical-query
status: active # active | achieved | abandoned | morphed | superseded
opened: YYYY-MM-DD
last-checked: YYYY-MM-DD
closed: "" # YYYY-MM-DD when status leaves `active`
supersedes: ""
superseded-by: ""
morphed-into: "" # link to new goal file if status: morphed
tags:
  - goal
---

> **Status lifecycle.** `active` → exactly one of:
> - `achieved` — the "done" criteria below were met. Append a one-line evidence link.
> - `abandoned` — the goal was dropped. Append a one-line reason. **Do not delete the file.**
> - `morphed` — the goal evolved into a different question. Set `morphed-into:` to the new goal file.
> - `superseded` — replaced by a clarified goal that is *the same intent, restated*. Set `superseded-by:`.
>
> A goal that is no longer worked on but has no closing status is **drift**. `/es-state` will surface this.
```

## Step 3 — Body sections (skeleton, user fills as work proceeds)

```markdown
# <verbatim goal text>

## What "done" looks like

<concrete, falsifiable criteria — fill at start>

## What I have right now

<starting state>

## Out of scope

<things this goal is **not** about; bound the rabbit hole>

## Anti-goals

<failure modes to avoid; e.g. "do not just collect papers; produce working understanding">

## Drift log

- [YYYY-MM-DD] <when later steps drifted; what realignment was made>
```

## Step 4 — Register in index

Add a one-liner to `wiki/index.md` under a `## Active goals` section.

## Step 5 — Re-read protocol

Print: "On every subsequent `/es-*` step in this session, re-read `notes/<slug>-query.md` first. If the next requested action does not advance the goal, surface that and stop."

## Step 6 — Next action

Usually `/es-domain` (if the goal is greenfield) or `/es-prereqs` (if it sits on top of known material).

## Guardrail

A goal that cannot be falsified is not a goal; it is a vibe. Insist the user produce concrete "done" criteria before proceeding.
