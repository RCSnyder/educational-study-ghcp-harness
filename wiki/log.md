# Wiki Log

Append-only timeline. Every entry begins with `## [YYYY-MM-DD] <op> | <subject>` so it is grep-able:

```bash
grep "^## \[" wiki/log.md | tail -20
grep "^## \[.*\] ingest" wiki/log.md
```

Operations: `ingest`, `query`, `lint`, `audit`, `update-atlas`, `promote` (draft → grounded), `demote` (any → stale).

---

<!-- Newest entries at the bottom. Do not edit historical entries. -->
