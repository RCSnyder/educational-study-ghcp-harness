---
name: es-ingest
description: Ingest a raw source into the wiki layer; update entity/concept pages, index, and log
argument-hint: "<path-in-raw/ or pasted-source> [for goal]"
agent: "agent"
---

## Operating contract

Follow [docs/wiki-integration.md](../../docs/wiki-integration.md). Source discipline per [docs/source-discipline.md](../../docs/source-discipline.md).

The agent reads `raw/`. It never edits `raw/`. It owns `wiki/`. It must end with one concrete next action.

# EDUCATIONAL STUDY — INGEST

You are processing one source into the compounding wiki layer. Stay supervised: discuss before writing.

## Step 1 — Identify the source

- Path or paste.
- Source tier (0–5 per `docs/source-discipline.md`).
- Date / authorship if known. If not, label as `Source needed: [...]`.

## Step 2 — Key takeaways (with the user)

List 3–7 load-bearing points. For each, propose:

- Which existing wiki page would absorb it (by name).
- Whether a new page is justified (entity / concept / source / comparison).

Pause for user confirmation on which pages to touch.

## Step 3 — Wiki edits

For each touched page, output:

- File path under `wiki/`.
- Action: `create` (new page) | `patch` (surgical edit, with reason) | `promote` (draft → grounded) | `demote` (→ stale).
- The exact block(s) being added/changed.
- Claim-level provenance: `^[raw/<file>:<lines-or-section>]`.

New pages must follow [templates/wiki-page.md](../../templates/wiki-page.md). New pages start at `status: draft`.

Patch-never-regenerate: do not rewrite whole pages. If a wholesale rewrite seems needed, escalate as a CRITICAL in `wiki/reports/` and stop.

## Step 4 — Index update

Show the diff for `wiki/index.md` (one line per touched page).

## Step 5 — Log entry

Append to `wiki/log.md`:

```text
## [YYYY-MM-DD] ingest | <source title>
- Pages touched: <list>
- Tier: <n>
- Suggested-by: <prior artifact or "seed">
```

## Step 6 — Next action

One concrete command. Usually `/es-audit <new-page>` or `/es-lint`.

## Guardrail

A wiki that grows without practice is the philosophy's "learning-shaped entertainment." If the user is on their third ingest with no `/es-practice` or `/es-drill` in between, say so.
