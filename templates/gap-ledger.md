---
type: gap-ledger
status: active
opened: YYYY-MM-DD
last-updated: YYYY-MM-DD
---

# Gap ledger

> The Dojo's compounding mechanism. One line per known weakness, dated and tagged. `/es-reach` reads this to propose the smallest drill that closes the highest-leverage gap. `/es-iwrong` populates it on the doubt side; failed `/es-problem` attempts populate it on the practice side.
>
> **Append-only by convention.** When a gap is closed, mark `closed: YYYY-MM-DD` on the line. Do not delete.
>
> Every entry should be **specific enough to drill against**. "I am bad at math" is not a gap. "Cannot derive separation-of-variables for non-rectangular boundaries" is a gap.

## Format

```
- [YYYY-MM-DD] [open|closed YYYY-MM-DD] [must-now|jit|specialist|fake|rabbit] <topic> | <specific weakness> | surfaced-by: <problem|iwrong|explain-back|other> | refs: <wiki-page-or-problem-link>
```

Classification (per `docs/research-atlas-philosophy.md` §9, §23):

- `must-now` — directly blocks the next problem you want to solve.
- `jit` — learn just-in-time when a problem demands it.
- `specialist` — only matters if you pivot into the subfield.
- `fake` — you _think_ it blocks you but it does not.
- `rabbit` — interesting but unrelated to the active goal.

`/es-reach` will preferentially target `must-now` gaps.

## Open gaps

<!-- Add new entries above this line. Most recent first. -->

## Closed gaps

<!-- Move closed gaps here when `closed:` is set. Keep dated record. -->
