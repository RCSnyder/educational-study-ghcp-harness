# Marginalia

Section-level glosses on a `raw/` source. The digital equivalent of writing in the margins. One marginalia file per ingested long source.

## File location

`wiki/source/<source-id>-marginalia.md`

## Frontmatter

```yaml
---
type: marginalia
source: [[source/<source-id>]]
status: draft
tier: 5 # your gloss; the source carries its own tier
suggested-by: ...
tags:
  - domain/...
---
```

## Body

```markdown
# Marginalia: <Source title>

## How to read this file

Each entry pairs a section/page anchor in `raw/` with one line of gloss — your best one-sentence summary of what's happening, why it matters, what to remember.

## Glosses

### `^[raw/file:Section 1]` — <Section 1 title>

> <one-line gloss>
> **Tag:** <key concept(s) introduced>
> **Connection:** [[wiki page that absorbs this]]

### `^[raw/file:Section 2]` — <Section 2 title>

> <one-line gloss>
> **Tag:** ...
> **Connection:** ...

### `^[raw/file:p. 47]` — <key passage, no section heading>

> <one-line gloss>
> **Quote:** "..."
> **Why this passage:** <one line>

## Hot spots

The 3–5 passages worth re-reading. Each one a wikilink to the gloss above and a one-line reason.

## What this source is _not_ good for

The opposite of "what to cite this for." Sections that are dated, contested, or peripheral.

## Open questions raised

Questions the source poses that it does not answer, and that you have not answered elsewhere yet.
```

## Rules

1. **One line per gloss.** If you need more, the gloss is a wiki page, not a marginalia entry. Promote it.
2. **Glosses point outward.** Every gloss links to a wiki concept/entity page where it is absorbed. Glosses without links are stranded; `/es-lint` flags them.
3. **Hot spots are limited to 5.** Forces you to choose. If everything is a hot spot, nothing is.

## Why this exists

Erudites read with a pen. The marginalia file is the pen. It also gives `/es-ingest` a stable surface to update as you re-read a source — you patch the gloss, not the underlying source.
