---
name: es-cite
description: Render a bibliography (BibTeX, CSL-JSON, or formatted citations) for a page or page set
argument-hint: "<page or glob> [--style apa|chicago|mla|ieee|nature|bibtex|csl-json]"
agent: "agent"
---

## Operating contract

Bibliography conventions per [templates/citation.md](../../templates/citation.md). Sources live under `wiki/bib/<key>.md` (one per cite key) plus their CSL-JSON or BibTeX block.

# EDUCATIONAL STUDY — CITE

## Step 1 — Resolve the target

- Single page (e.g. `wiki/concept/laplace-equation.md`) or glob (`wiki/concept/em-*.md`).
- Default style: `chicago`. Honor `--style` flag if given.

## Step 2 — Collect citation keys

- Scan target file(s) for `[@<key>]` references and `cited:` frontmatter.
- For each key, locate `wiki/bib/<key>.md`. Missing keys are listed at the end as **"Missing bibliography entries"** — do not fabricate.

## Step 3 — Render

- For `bibtex`: emit a `.bib` block with all entries, alphabetized by key.
- For `csl-json`: emit a JSON array.
- For `apa | chicago | mla | ieee | nature`: emit formatted reference list, alphabetized by author surname.
- Always show citation count and any duplicate-key collisions.

## Step 4 — Coverage report

- Claims in the page tagged `^[raw/...]` but lacking `[@key]`: list them.
- Claims with neither anchor: list them as **unsourced; needs verification**.

## Step 5 — Next action

Usually `/es-fetch <missing-key>` to populate missing bibliography entries, or `/es-audit` if coverage is thin.

## Guardrail

Never fabricate a missing entry. A bibliography with invented DOIs or page numbers is worse than no bibliography at all.
