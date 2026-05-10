# Citation Entry

Place CSL-JSON or BibTeX entries under `wiki/bib/`. One file per source. Filename is the cite key.

## Frontmatter (matches wiki-page.md schema)

```yaml
---
type: source
tier: 1 # 1 primary, 2 authoritative synthesis, 3 teaching, 4 secondary
cite-key: griffiths2017
status: grounded
suggested-by: notes/em-source-pack.md
tags:
  - domain/physics
  - subfield/electromagnetism
---
```

## BibTeX form (preferred for LaTeX users)

```bibtex
@book{griffiths2017,
  author    = {Griffiths, David J.},
  title     = {Introduction to Electrodynamics},
  edition   = {4},
  year      = {2017},
  publisher = {Cambridge University Press},
  isbn      = {978-1108420419},
  note      = {Tier 2 — authoritative undergraduate textbook}
}
```

## CSL-JSON form (preferred for Pandoc/Zotero users)

```json
{
  "id": "griffiths2017",
  "type": "book",
  "author": [{ "family": "Griffiths", "given": "David J." }],
  "title": "Introduction to Electrodynamics",
  "edition": "4",
  "issued": { "date-parts": [[2017]] },
  "publisher": "Cambridge University Press",
  "ISBN": "978-1108420419"
}
```

## In-page usage

In any wiki / notes / papers / problems file, cite by key:

```markdown
The Laplace equation is the steady-state limit [@griffiths2017, §3.1].
```

`/es-cite` renders the bibliography for any page or any set of pages by gathering all `[@key]` references and emitting BibTeX, CSL-JSON, or formatted citations in the requested style (APA, Chicago, MLA, IEEE, Nature, etc.).

## Provenance pointer

Every `wiki/bib/<key>.md` should also carry, after the metadata block, a section listing where the source lives in `raw/`:

```markdown
## Local copy

- `raw/griffiths-em-4e.pdf`
- Span anchors: `^[raw/griffiths-em-4e.pdf:Chapter 3]`

## Pages citing this source

_(filled by `/es-lint --backlinks`; do not edit manually)_
```
