---
type: problem
status: draft
source: "" # original; this is a worked demo, not a textbook problem
source-locator: ""
verbatim: false
own-paraphrase: ""
license-note: ""
well-posed: checked-by-hand
formalizable: true
verification:
  method: sympy
  artifact: verify/example-cauchy-schwarz.py
  last-run: ""
  last-result: not-run
  notes: "Symbolic proof of the 2D Cauchy–Schwarz inequality identity."
tags:
  - example
  - inequality
  - demo
  - problem
---

# Example: Cauchy–Schwarz inequality (2D, real)

> **This page is a demo round-trip.** It exists so you can run `/es-verify example-cauchy-schwarz` from a fresh repo and confirm the verification wiring works end-to-end. Delete it before publishing your real vault if you don't want it in your history — but per the non-destructive history rule, prefer to keep it.

## Statement (own words)

For real numbers $a_1, a_2, b_1, b_2$:

$$ (a_1 b_1 + a_2 b_2)^2 \le (a_1^2 + a_2^2)(b_1^2 + b_2^2) $$

with equality iff $(a_1, a_2)$ and $(b_1, b_2)$ are linearly dependent.

## What this tests

- The verification frontmatter loop end-to-end.
- The `sympy` method dispatch in `/es-verify`.
- That a `pass` result correctly flags the page as eligible-but-not-yet-promoted.

## Sketch (informal)

The Lagrange identity:

$$ (a_1^2 + a_2^2)(b_1^2 + b_2^2) - (a_1 b_1 + a_2 b_2)^2 = (a_1 b_2 - a_2 b_1)^2 $$

The right-hand side is a square of a real number, hence $\ge 0$. The inequality follows. Equality iff $a_1 b_2 = a_2 b_1$, i.e. the vectors are linearly dependent.

## Verification artifact

[`verify/example-cauchy-schwarz.py`](../verify/example-cauchy-schwarz.py) checks the Lagrange identity symbolically with SymPy. A `pass` here is symbolic-equivalence evidence — strong for this case (polynomial identity over $\mathbb{R}$), but **not equivalent to a Lean proof**.

## Promotion note

Even after `/es-verify` returns `pass`, this page is not auto-promoted to `grounded`. Verification is one gate; `/es-audit` is another. Promotion happens only after both pass and a commit body cites both. This is intentional.
