# `verify/` — formal verification artifacts

This directory holds the **machine-checkable proofs and tests** that back claims in the vault. It is the academic-credibility layer.

## Why this directory exists

Two real problems the vault must answer to be taken seriously:

1. **Copyright on textbook problems** — we cannot commit verbatim problem text from copyrighted sources.
2. **Correctness of the math** — narrative proofs and worked examples are evidence, not certification. For anything that _can_ be formalized, it should be.

This file is the spec for both. `/es-verify`, `/es-audit`, and `/es-lint` read these rules.

---

## Part 1 — IP rule for problems

The vault commits, for any non-original problem:

- a citation key (`[@cite-key]` resolving to `wiki/bib/<key>.md`),
- a page / exercise locator,
- **your own paraphrase** of the problem (one or two lines, your words, fair-use commentary),
- the topic, what it tests, your work, and the verification artifact.

The vault does **not** commit verbatim problem text from a copyrighted source unless `license-note:` documents permission (e.g. CC-BY exercise set, MIT-licensed problem bank, public-domain text).

Required frontmatter on every `problems/*.md`:

```yaml
source: "" # "" for original; otherwise [@cite-key]
source-locator: "" # required if source is set; e.g. "ex 4.3.2 p.187"
verbatim: false # MUST be false for cited sources unless license-note allows
own-paraphrase: "" # required if source is set
license-note: "" # required if verbatim: true
well-posed: unchecked # unchecked | checked-by-hand | checked-against-errata | failed
```

`/es-lint` flags as **CRITICAL**:

- `source:` set + `verbatim: true` + empty `license-note:`
- `source:` set + empty `own-paraphrase:`
- `well-posed: failed` on any page whose dependents are `status: grounded`

Original problems you compose carry `source: ""` and are unrestricted.

---

## Part 2 — Verification protocol

### Frontmatter (added to `templates/proof.md` and `templates/problem-lab.md`)

```yaml
formalizable: true # false exempts from the verification gate (humanities, qualitative)
verification:
  method: none # lean | tlaplus | python-test | python-numeric | sympy | manual | none
  artifact: "" # path under verify/, e.g. verify/cauchy-schwarz.lean
  last-run: "" # YYYY-MM-DD
  last-result: not-run # pass | fail | partial | not-run
  notes: "" # free text; required if method: manual
```

### Methods supported

| method           | what counts as `pass`                                                                                      | what counts as `partial`      |
| ---------------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `lean`           | `lake build` (or scoped build) succeeds, **zero `sorry`s**                                                 | builds with `sorry` count > 0 |
| `tlaplus`        | TLC model-checker terminates with no error on the declared _bounded_ model; bounds declared in commit body | only smoke- or syntax-checked |
| `python-test`    | `uv run --with pytest pytest verify/<slug>.py` exit 0                                                      | xfail / skip present          |
| `python-numeric` | `uv run verify/<slug>.py` exits 0 and all assertions pass                                                  | tolerance > declared epsilon  |
| `sympy`          | `uv run verify/<slug>.py` exits 0; symbolic round-trip equals declared closed form                         | requires manual gloss         |
| `manual`         | **never automatic.** Requires human attestation in commit body, and `notes:` explaining why no automation. | n/a                           |
| `none`           | only valid for `formalizable: false` pages                                                                 | n/a                           |

### Python tooling: `uv` is the only path

All Python verification artifacts (`python-test`, `python-numeric`, `sympy`) run under [`uv`](https://docs.astral.sh/uv/) with **PEP 723 inline script metadata**. There is no `requirements.txt`, no `pyproject.toml` at the repo root for `verify/`, no virtualenv to activate, and no global `pip install`.

Every Python artifact under `verify/` starts with a header like:

```python
# /// script
# requires-python = ">=3.11"
# dependencies = ["sympy>=1.12"]
# ///
```

Run it with:

```bash
uv run verify/<slug>.py
```

uv resolves the declared deps into an ephemeral, cached environment and executes the script. Re-runs are fast (cached); CI is reproducible (versions pinned in the header); the repo stays clean (no lockfile sprawl per artifact).

For pytest-style suites, either declare `pytest` in the script's PEP 723 block (preferred) or pass it on the command line:

```bash
uv run --with pytest pytest verify/<slug>.py -q
```

Install uv: `winget install astral-sh.uv` (Windows), `brew install uv` (macOS), or `curl -LsSf https://astral.sh/uv/install.sh | sh` (Linux). `/es-verify` refuses if `uv` is not on `PATH` rather than falling back to a system `python`/`pip` — that fallback is what causes the "works on my machine" rot this directory exists to prevent.

### Honest limits (read this before claiming anything)

- **Lean / TLA+ verify implication, not premises.** A formal proof shows the conclusion follows from the stated hypotheses. It does not show the hypotheses model the real system, the problem statement is well-posed, or the question is the right question. `well-posed:` covers statement; modeling fidelity is a `wiki/concept/` discussion.
- **TLA+ `pass` is _bounded_ model checking, not proof.** TLC checks the spec on a finite instance (a chosen number of processes, a depth bound, etc.). A `pass` on a 4-process model says nothing about the parameterized 1000-process system. The commit body for any `tlaplus: pass` must declare the model bounds (state count, depth, parameters). For unbounded guarantees you need TLAPS (the proof system) and that is a separate manual artifact, not what TLC produces.
- **Numeric agreement is evidence, not proof.** A SymPy/NumPy match to 1e-10 is `python-numeric: pass` — _not_ relabeled as `lean: pass`. Don't lie in frontmatter.
- **`sorry` is visible.** Lean files with any `sorry` are at most `partial`, never `pass`.
- **Translation is not in scope.** This protocol does not auto-translate informal proofs to Lean. That's a research problem. You write the formal artifact yourself, or you mark `manual`.
- **Most humanities/qualitative work has no formal analog.** Use `formalizable: false`. The audit gate exempts those pages. Don't invent fake formalization to pass the gate.
- **The `formalizable: false` escape hatch is a known perverse incentive.** A page that _could_ in principle be formalized but is hard to formalize will tempt the user to flip `formalizable: false` to bypass the gate. The audit step records the exemption reason, but the user can write any reason. Mitigation, not prevention: `/es-stats` (when patched) reports the ratio of `formalizable: false` pages over time; sudden growth in that ratio is a signal worth investigating. The discipline ultimately rests on the author's intellectual honesty, not on tooling.

### Promotion gate (enforced by `/es-audit`)

A page with `formalizable: true` cannot be promoted to `status: grounded` unless:

- `verification.method` is one of `lean | tlaplus | python-test | python-numeric | sympy`,
- AND `verification.last-result: pass`,
- AND `verification.last-run` is not stale (within 90 days _and_ newer than the artifact's mtime).

OR:

- `verification.method: manual` with non-empty `notes:` justifying why automation is infeasible, AND a commit body containing `Manually re-verified by <name> on YYYY-MM-DD`.

Pages with `formalizable: false` are exempt; the audit must record _why_ (`formalization-note:` or audit body).

### Staleness (enforced by `/es-lint`)

A `verification: pass` page is **stale** if any of:

- `last-run` is older than 90 days,
- `last-run` is older than the artifact file's mtime,
- `last-run` is older than any file the artifact depends on (best-effort, by import scan).

Stale pages remain `grounded` but are flagged `WARNING` by lint and `/es-stats` (when `/es-stats` is patched in a future wave).

---

## Part 3 — Directory layout

```
verify/
  README.md                  ← this file (the spec)
  <slug>.lean                ← Lean 4 proof; matches problems/<slug>.md or wiki/concept/<slug>.md
  <slug>.tla                 ← TLA+ spec
  <slug>.py                  ← Python (test or numeric or sympy)
  <slug>/                    ← multi-file artifact (e.g. Lean module, lakefile, tlc config)
    lakefile.lean
    Mathlib.lean
    ...
```

Tool installation is the user's responsibility. The vault does not bundle Lean, TLA+, or Python runtimes. `/es-verify` shells out and reports the result.

---

## Part 4 — Workflow

1. Write the problem or proof page under `problems/` or `wiki/concept/`. Set `formalizable: true` and `verification.method: <choice>`.
2. Write the verification artifact under `verify/<slug>.*`.
3. Run `/es-verify <slug>`. It executes the artifact, updates frontmatter, proposes a `verify(<slug>): <method> <result>` commit.
4. When promoting the page to `grounded`, `/es-audit` reads the verification block and either approves or refuses.
5. Periodically (and before any `/es-snapshot`), re-run `/es-verify --all` or targeted runs to refresh `last-run`.

---

## Part 5 — Commit conventions

- `verify(<slug>): lean pass` — successful run.
- `verify(<slug>): lean partial — N sorries remain` — body lists which lemmas.
- `verify(<slug>): lean fail` — body shows error excerpt; status reverts to `draft` if previously `grounded`.
- `verify(<slug>): manual attest — <one-line reason>` — body is required.

`verify` joins the conventional-commit type table in `README.md` and `AGENTS.md`. (Patch deferred to a follow-up if not already present.)
