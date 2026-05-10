# Case Brief

IRAC scaffolding for legal study. One page per case, statute, or regulation.

## Frontmatter

```yaml
---
type: case # case | statute | regulation | doctrine
status: draft
tier: 1 # cases and statutes are primary
confidence: high
jurisdiction: US-Federal # or state, country, court name
court: SCOTUS
decided: 1803-02-24
citation: 5 U.S. (1 Cranch) 137
precedential: binding # binding | persuasive | superseded | overruled
overruled-by: "" # citation if applicable
cites:
  - [[case/...]]
cited-by: [] # filled by /es-lint --backlinks
tags:
  - domain/law
  - subfield/constitutional
---
```

## Body

```markdown
# <Case Name>, <citation>

## Procedural posture

Who sued whom, in what court, on appeal from where, on what grounds.

## Facts

The court's stated facts. Stick close to the opinion's framing; do not editorialize. (You can editorialize in the **Reading** section below.)

## Issue(s)

The legal question(s) the court actually decided. One per line.

1. ...
2. ...

## Rule

The rule of law the court announces. Distinguish:

- **Black-letter rule** (the rule as it now exists)
- **Test / standard** (the operationalization)
- **Elements** (the components a litigant must satisfy)

## Application (court's reasoning)

How the court applies the rule to the facts. Track the chain of reasoning.

## Holding

The narrowest disposition. One sentence per issue.

## Dicta

What the court said that is **not** the holding. Useful for predicting the court's future moves; not binding precedent.

> **Holding vs dicta is never blurred on this page.** A reader must be able to tell which is which without effort.

## Concurrences and dissents

- <Justice X>, concurring: ...
- <Justice Y>, dissenting: ...

## Subsequent treatment

- Affirmed / distinguished / limited / overruled by: [[case/...]]
- Citing later cases: see `cited-by:` frontmatter (auto-populated)

## Reading (your interpretation)

Separate from the court's own framing. What does this case mean today? What did it mean at the time? What is contested in its modern reading?

## What would falsify or revise this reading

The kind of subsequent decision, statute, or scholarship that would force a rewrite.

## Open questions

- ...

## Provenance

- Opinion text: ^[raw/...]
- BibTeX: [@case-key]
- CourtListener / Westlaw / Lexis ID: ...
```

## Rules

1. **Holding vs dicta is sectionally separated.** No mixing.
2. **Procedural posture before facts.** Without it, the holding is misread.
3. **Statutes get the same template** with "Issue / Rule / Application / Conclusion" replaced by "Text / Legislative History / Canonical Interpretation / Open Constructions".
4. **Distinguish on its own page** (`wiki/comparison/<A>-vs-<B>.md`) when two cases are routinely compared.
