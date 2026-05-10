---
name: es-log
description: Read wiki/log.md and summarize recent activity; supports filters (ingest/query/lint/audit/promote/demote)
argument-hint: "[filter] [count]"
agent: "ask"
---

## Operating contract

Read-only. Do not edit `wiki/log.md`.

# EDUCATIONAL STUDY — LOG

Read `wiki/log.md` and summarize.

- If a filter is given (e.g. `ingest`, `lint`, `audit`), restrict to entries whose op matches.
- If a count is given, return only the most recent N entries.
- Default: last 10 entries, all ops.

## Output

```markdown
## Recent activity

- [YYYY-MM-DD] <op> | <subject> — <one-line takeaway>
- ...

## Patterns

- Pages touched most often: ...
- Domains active in last 7 entries: ...
- Ops without follow-through (e.g. ingests with no audit/practice): ...

## Recommended next action

A single command, biased toward closing open loops over starting new ones.
```

## Guardrail

If the log shows three or more consecutive ingest/query ops with no `/es-practice`, `/es-drill`, or `/es-solve`, flag this. The philosophy treats unbroken collection without practice as a failure mode.
