---
name: es-decision
description: Append a decision-journal entry — choice, reasoning, expected outcome, confidence
argument-hint: "<decision in one line>"
agent: "agent"
---

## Operating contract

Format per [templates/decision-journal.md](../../templates/decision-journal.md). Append to [notes/decision-journal.md](../../notes/decision-journal.md). Periodic Brier-score review via `/es-calibrate`.

# EDUCATIONAL STUDY — DECISION

## Step 1 — Worth journaling?

Filter: this command is for **direction-changing** decisions, not routine reading. Acceptable triggers:

- Switching textbooks or primary source.
- Choosing a Tier 2 anchor.
- Declaring a topic "good enough" for a goal.
- Picking one method/framework over another.
- Explicitly **not** going down a rabbit hole.

Routine ingest does not count. If this is routine, refuse politely and suggest `/es-log` instead.

## Step 2 — Capture the entry

Walk the user through the schema, one field at a time:

1. **Context** — one sentence; the situation forcing the decision.
2. **Options considered** — A, B, C; if only one option is listed, ask "what else did you reject and why?"
3. **Choice** — which option.
4. **Reasoning** — 2–4 sentences. Refuse "it seemed right." Demand a load-bearing reason.
5. **Expected outcome** — concrete, with a date or trigger.
6. **Confidence** — 0..1. Avoid 0.5 (uninformative); push the user off it.
7. **Could-be-wrong vector** — single most likely failure mode. Mandatory.
8. **Trigger to revisit** — event or date.
9. **Cost of being wrong** — low / medium / high.
10. **Reversible?** — yes / no / partial.

## Step 3 — Append

Newest entries on top. Do not edit prior entries.

## Step 4 — Cross-reference

- If the decision concerns a wiki page, patch the page's frontmatter to add `decision: [[notes/decision-journal#<anchor>]]`.
- If the decision overrides a previous one, link the prior entry under "Supersedes:" — do **not** delete the prior entry.

## Step 5 — Log

```text
## [YYYY-MM-DD] decision | <one-line decision>
- Confidence: <p>
- Reversible: yes/no/partial
```

## Step 6 — Next action

Set a calendar (or note-system) reminder for the trigger date. The agent cannot do this; it instructs the user.

## Guardrail

A decision-journal entry without a "could-be-wrong vector" is performative. Refuse to append until the user supplies one.
