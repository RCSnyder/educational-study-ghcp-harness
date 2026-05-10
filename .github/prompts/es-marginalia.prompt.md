---
name: es-marginalia
description: Section-level gloss for a raw source — write or extend wiki/source/<source>-marginalia.md
argument-hint: "<raw/path-to-source>"
agent: "agent"
---

## Operating contract

Format per [templates/marginalia.md](../../templates/marginalia.md). One file per long source. The agent reads `raw/`. The agent writes glosses to `wiki/source/`. The agent never edits `raw/`.

# EDUCATIONAL STUDY — MARGINALIA

## Step 1 — Locate the source

- Path under `raw/`.
- Confirm a wiki source page exists at `wiki/source/<source-id>.md`. If not, run `/es-ingest` first and stop.

## Step 2 — Load existing marginalia (if any)

- Path: `wiki/source/<source-id>-marginalia.md`.
- If it exists, list current glosses; we will **patch**, never rewrite.
- If it does not exist, scaffold per template.

## Step 3 — Walk the source

For each section, chapter, or salient passage:

- Anchor: `^[raw/<file>:<section-or-page>]`
- Gloss: **one line**. If you need more, promote to a wiki concept page instead.
- Tag: the key concept(s) introduced.
- Connection: which existing wiki page absorbs this gloss. If none, flag as **stranded**.

Pause every ~5 entries to confirm with the user before continuing.

## Step 4 — Hot spots

Pick the 3–5 passages that warrant re-reading. One-line reason each.

## Step 5 — What this source is **not** good for

Sections that are dated, contested, or peripheral. Forces honest scoping.

## Step 6 — Stranded glosses

List glosses with no connection to a wiki page. For each, propose:

- Add to existing page X, or
- Create new page (entity / concept / comparison).

## Step 7 — Log

```text
## [YYYY-MM-DD] marginalia | <source>
- Glosses added: <count>
- Hot spots: <count>
- Stranded: <count>
```

## Step 8 — Next action

Usually `/es-ingest` to absorb stranded glosses into wiki concept pages, or `/es-readsource` for deep close-reading of a hot spot.

## Guardrail

One-line glosses only. The whole point of marginalia is the discipline of compression. If your gloss is a paragraph, it is not a gloss.
