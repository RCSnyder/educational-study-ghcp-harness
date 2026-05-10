---
name: es-export
description: Bundle a wiki subset for offline use — Pandoc PDF, Marp slide deck, or JSON-LD knowledge graph
argument-hint: "<page or glob> --format pdf|slides|json-ld|epub|docx"
agent: "agent"
---

## Operating contract

Markdown is truth; everything else is a lossy snapshot. This command emits the snapshot for sharing, lectures, or interop with other tools. Source of truth never changes.

# EDUCATIONAL STUDY — EXPORT

## Step 1 — Resolve target set

- Single page, glob, or named bundle (e.g. `domain:em` exports all `tags: [domain/em]`).
- Compute transitive closure if `--with-deps` is set (follows `depends-on:` edges).

## Step 2 — Format-specific plan

### `--format pdf` (Pandoc)

- Emit `pandoc` invocation:
  ```bash
  pandoc <files> -o out.pdf \
    --from=markdown+yaml_metadata_block \
    --citeproc --bibliography=wiki/bib/ \
    --csl=<style.csl> \
    --pdf-engine=xelatex
  ```
- Resolve `[@cite]` keys against `wiki/bib/` and warn on misses.
- Resolve `[[wikilinks]]` — by default convert to inline references; with `--keep-links` keep them as hyperlinks.

### `--format slides` (Marp)

- Convert headings: each H2 becomes a slide.
- Print Marp frontmatter and the converted content.
- Honor `style: <name>` from frontmatter; default to a minimal academic theme.

### `--format json-ld`

- Emit a JSON-LD knowledge graph:
  - Nodes: pages with `@id`, `@type`, `name`, `tier`, `status`.
  - Edges: from `[[wikilinks]]`, `depends-on:`, `cites:`.
- Schema.org vocabulary where it fits (`ScholarlyArticle`, `DefinedTerm`).

### `--format epub` / `--format docx`

- Same Pandoc invocation as PDF with format swapped.

## Step 3 — Coverage report

- Pages that lack required frontmatter for clean export (missing `tier:`, `status:`, etc.).
- Cite keys with no `wiki/bib/` entry.
- Wikilinks that resolve to no file.

The agent does **not** silently fix these; it reports them.

## Step 4 — Write the bundle plan

- Output the exact command(s) the user runs.
- If pandoc/marp/etc. are not installed, note the install command but do not auto-install.
- Do not execute the export unless the user explicitly says so.

## Step 5 — Log

```text
## [YYYY-MM-DD] export | <target> | format: <fmt>
- Pages: <count>
- Output: <path>
```

## Step 6 — Next action

Usually `/es-cite` if missing bib entries blocked export, or `/es-lint` if frontmatter gaps are widespread.

## Guardrail

Export is a **read** operation. It must never modify wiki content. If the user asks to "fix things during export," redirect to `/es-lint`.
