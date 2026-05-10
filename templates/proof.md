# Theorem / Proof Page

Math and theoretical CS scaffolding. One file per theorem, lemma, or major definition.

## Frontmatter

```yaml
---
type: theorem # theorem | lemma | corollary | definition | proposition | conjecture
status: draft # draft | grounded | stale
proof-status: sketch # none | sketch | informal | full | reproduced
tier: 1
confidence: high
suggested-by: ...
depends-on:
  - [[definition/...]]
  - [[lemma/...]]
used-by:
  - [[theorem/...]]
formalizable: true # false exempts from the verification gate
verification:
  method: none # lean | tlaplus | python-test | python-numeric | sympy | manual | none
  artifact: "" # path under verify/, e.g. verify/<slug>.lean
  last-run: "" # YYYY-MM-DD
  last-result: not-run # pass | fail | partial | not-run
  notes: "" # free text; required if method: manual
tags:
  - domain/mathematics
  - subfield/...
---
```

## Body

```markdown
# <Name of Theorem>

## Statement

> **Theorem (<Name>).** Let ... . Then ...

(Use LaTeX freely: $X = \int f$, $$\sum_{n=1}^\infty \frac{1}{n^s}$$.)

## Intuition

One paragraph. What is this really saying? What picture should be in the reader's head before reading the proof?

## Proof

<full proof, or sketch with explicit gaps marked>

> **Gap:** <if this is a sketch, name what's missing>

## Where the conditions are used

- Condition A — used at step ...
- Condition B — used at step ...
- (If a condition is never used, the theorem is overstated.)

## Counterexample to the converse

<the canonical example showing the converse fails>

## Common over-generalizations

- "X is true without condition A" — false; counterexample: ...
- "X holds for all spaces of type Y" — false; ...

## Failure modes / what would falsify

- Empirical/computational test that would refute: ...
- Logical contradiction that would refute: ...

## Provenance

- Original: [@author1900]
- Modern reference: [@textbook2020, Theorem 3.5]
- Local copy: ^[raw/...]
```

## Rules

1. **A theorem page with `proof-status: sketch` cannot reach `status: grounded`.** Either complete the proof or leave it as draft.
2. **`depends-on:` is enforceable.** A page cannot reach `grounded` if any dependency is `stale` or absent.
3. **Counterexample to the converse is required.** If you cannot produce one, you do not understand the theorem yet.
4. **Computational verification optional but logged.** If the theorem permits numerical or symbolic verification (Mathematica, SymPy, Lean, Coq), record the run in `wiki/source/<theorem>-verification.md`.
