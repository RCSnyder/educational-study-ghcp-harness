# /// script
# requires-python = ">=3.11"
# dependencies = ["sympy>=1.12"]
# ///
"""
Verification artifact for problems/example-cauchy-schwarz.md.

Symbolic check of the Lagrange identity, which implies the 2D real
Cauchy–Schwarz inequality:

    (a1*b1 + a2*b2)^2 <= (a1^2 + a2^2) * (b1^2 + b2^2)

via the identity

    (a1^2 + a2^2)*(b1^2 + b2^2) - (a1*b1 + a2*b2)^2 == (a1*b2 - a2*b1)^2

The RHS is a square of a real number, hence >= 0.

This is a demo of the /es-verify sympy method. A `pass` here is symbolic
equivalence evidence over the polynomial ring Q[a1,a2,b1,b2]; it is not
equivalent to a Lean proof. See verify/README.md Part 2 ("Honest limits").

Run:
    uv run verify/example-cauchy-schwarz.py

(uv reads the PEP 723 inline metadata above and provisions sympy in an
ephemeral environment. No `pip install` needed; no global pollution.)

Pass criterion: exit 0 and the script prints a line beginning "EQUIV: "
(required by /es-verify for the sympy method).
"""

import sys

import sympy as sp


def main() -> int:
    a1, a2, b1, b2 = sp.symbols("a1 a2 b1 b2", real=True)

    lhs = (a1**2 + a2**2) * (b1**2 + b2**2) - (a1 * b1 + a2 * b2) ** 2
    rhs = (a1 * b2 - a2 * b1) ** 2

    diff = sp.expand(lhs - rhs)
    assert diff == 0, f"Lagrange identity failed: lhs - rhs = {diff}"

    # The RHS being a square of a real number is >= 0 by construction.
    # SymPy will not prove ">= 0" symbolically without an oracle, but the
    # identity above plus the fact that (a1*b2 - a2*b1) is real is enough
    # to conclude Cauchy-Schwarz. This is the part that needs the human
    # gloss on the page; the symbolic engine only certifies the identity.

    print(f"EQUIV: (a1^2+a2^2)(b1^2+b2^2) - (a1 b1 + a2 b2)^2 == (a1 b2 - a2 b1)^2")
    return 0


if __name__ == "__main__":
    sys.exit(main())
