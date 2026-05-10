---
name: es-lint
description: Structural health check across wiki/ — contradictions, stale claims, orphans, missing tiers, broken links
argument-hint: "[scope: all | wiki | maps | notes]"
agent: "agent"
---

## Operating contract

Follow [docs/wiki-integration.md](../../docs/wiki-integration.md). Lint **never edits** files. It produces a report.

# EDUCATIONAL STUDY — LINT

Read across the requested scope (default: `wiki/`) and produce a report at `wiki/reports/lint-<YYYY-MM-DD>.md`.

## Checks

1. **Contradictions** — pages whose core claims conflict, with citations on both sides.
2. **Stale claims** — `status: grounded` pages whose newest source predates a more recent ingested source on the same concept.
3. **Orphan pages** — no inbound `[[wikilinks]]`, no entry in `wiki/index.md`.
4. **Missing pages** — concepts referenced via `[[...]]` that do not exist.
5. **Missing tiers** — nontrivial claims without a source tier or `Source needed:` marker.
6. **Broken links** — wikilinks or `^[raw/...]` pointing at nonexistent files.
7. **Disconnected provenance** — pages whose `suggested-by:` chain does not reach a seed source.
8. **Unresolved CRITICAL** — markers from prior `/es-audit` passes that have not been addressed.
9. **Status drift** — `status: draft` pages older than the rigor profile's freshness window.
10. **IP rule on problems** — see [`verify/README.md`](../../es-verify/README.md). Flag as **CRITICAL** any `problems/*.md` with:
    - `source:` set **and** `verbatim: true` **and** empty `license-note:` (copyright risk),
    - `source:` set **and** empty `own-paraphrase:` (no fair-use commentary),
    - `well-posed: failed` whose dependents are `status: grounded`.
11. **Verification staleness** — for any page with `verification.last-result: pass`, flag as **WARNING** if any of:
    - `last-run` is older than 90 days,
    - `last-run` is older than the artifact file's mtime,
    - the artifact file does not exist at the declared path.
12. **Verification method honesty** — flag as **CRITICAL** any page with `verification.method: lean` or `tlaplus` whose declared `artifact:` does not exist or has a mismatched extension (e.g. method `lean` but artifact `*.py`).

## Report format

```markdown
# Lint Report — YYYY-MM-DD

## Summary

- Pages scanned: N
- Issues by severity: critical / warning / info

## Critical

- [page]: <issue> — proposed action

## Warnings

- ...

## Info

- ...

## Suggested next actions

1. ...
```

## Guardrail

Lint catches structural failure, not factual accuracy. Do not certify a page as correct; only certify that it has the structural prerequisites for the human to evaluate.

## Next action

Recommend exactly one of: `/es-ingest <new-source>`, `/es-audit <page>`, `/es-update-atlas <domain>`, or `/es-anti-rabbithole <topic>`.
