# Problem Lab

## Frontmatter

Required on every `problems/*.md`. Spec: [`verify/README.md`](../es-verify/README.md).

```yaml
---
type: problem
status: draft
source: "" # "" for original; otherwise [@cite-key] resolving to wiki/bib/<key>.md
source-locator: "" # required if source is set; e.g. "ex 4.3.2 p.187"
verbatim: false # MUST be false for cited sources unless license-note allows
own-paraphrase: "" # required if source is set; one-line, your words, fair-use commentary
license-note: "" # required if verbatim: true (e.g. "CC-BY exercise set")
well-posed: unchecked # unchecked | checked-by-hand | checked-against-errata | failed
formalizable: true # false exempts from the verification gate (qualitative problems)
verification:
  method: none # lean | tlaplus | python-test | python-numeric | sympy | manual | none
  artifact: "" # path under verify/, e.g. verify/<slug>.lean
  last-run: "" # YYYY-MM-DD
  last-result: not-run # pass | fail | partial | not-run
  notes: "" # free text; required if method: manual
tags:
  - problem
---
```

## Problem

## Problem type

## What this tests

## Governing principle

## Known / unknown

## Minimal tools

## My attempt

## Solution skeleton

## Full solution

## Checks

- Units/dimensions:
- Limiting cases:
- Sign/symmetry:
- Conservation/consistency:

## Reusable pattern

## Similar problems

## What to review

## Good-enough evidence
