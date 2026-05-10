---
type: gap-ledger
status: active
opened: "" # set on first real entry
last-updated: "" # set on first real entry
---

# Gap ledger

> The Dojo's compounding mechanism. One line per known weakness, dated and tagged. `/es-reach` reads this to propose the smallest drill that closes the highest-leverage gap. `/es-iwrong` populates it on the doubt side; failed `/es-problem` attempts populate it on the practice side.
>
> See [`templates/gap-ledger.md`](../templates/gap-ledger.md) for the format and classification scheme (`must-now`, `jit`, `specialist`, `fake`, `rabbit`).
>
> **Append-only by convention.** When a gap is closed, mark `closed: YYYY-MM-DD` on the line and move it to the **Closed** section. Do not delete.

## Open gaps

<!-- Add new entries above this line. Most recent first. Format:
- [YYYY-MM-DD] open [must-now|jit|specialist|fake|rabbit] <topic> | <specific weakness> | surfaced-by: <problem|iwrong|explain-back> | refs: <link>
-->

## Closed gaps

<!-- Format:
- [YYYY-MM-DD] closed YYYY-MM-DD [classification] <topic> | <weakness> | surfaced-by: ... | closed-by: <commit-sha-or-problem-link>
-->
