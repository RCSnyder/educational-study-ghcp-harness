---
name: es-verify
description: Run the formal verification artifact for a problem or proof page (Lean, TLA+, Python, SymPy, or manual attestation). Updates frontmatter and proposes a verify(...) commit.
argument-hint: "<slug> | --all | --stale"
agent: "agent"
---

## Operating contract

Read [`verify/README.md`](../../es-verify/README.md) **first**. It is the spec for IP, frontmatter, supported methods, promotion gate, staleness, and commit conventions. This command is the actuator; the spec is in `verify/README.md`.

`/es-verify` does not invent verification. It runs an artifact that **already exists** under `verify/<slug>.*` and reports honestly. If no artifact exists, it refuses and tells the user what to write.

## Step 0 — Capability check

`/es-verify` requires the ability to actually run external programs (`lake`, `tlc`, `uv`). The exception is `tlaplus` when the `chat-tools-tlaplus_*` MCP tools are loaded — those run in-environment and do not require terminal access.

If neither terminal access nor the TLA+ MCP tools are available for the requested method:

```markdown
## Cannot verify in this session

`/es-verify <slug>` requires <terminal access | TLA+ MCP tools> to run the `<method>` artifact at `verify/<slug>.<ext>`. Neither is available in the current chat mode.

No frontmatter changes made. No commit proposed.

To proceed: re-run in a chat mode with terminal access, or run the artifact manually:

    <exact shell command for the method>

Then update `verification.last-run` and `verification.last-result` by hand and commit as `verify(<slug>): <method> <result>`.
```

Stop. Do **not** fabricate a result.

# EDUCATIONAL STUDY — VERIFY

## Step 1 — Resolve the target

- `/es-verify <slug>` — the single artifact `verify/<slug>.*` (or directory `verify/<slug>/`).
- `/es-verify --all` — every page with `verification.method` set to a non-`manual`/`none` value.
- `/es-verify --stale` — every `verification: pass` page whose `last-run` is older than 90 days, older than the artifact's mtime, or older than the dependent page's mtime.

For each target:

1. Locate the page (`problems/<slug>.md` or `wiki/concept/<slug>.md` or `wiki/theorem/<slug>.md`).
2. Read its `verification:` frontmatter. If the block is missing, refuse with a one-line message naming the missing fields.
3. Locate `verification.artifact` under `verify/`. If missing, refuse and suggest writing it.

Do not fabricate verification. Refusing is the correct outcome when the inputs are not there.

## Step 2 — Dispatch by method

### `lean`

Run (the user's repo may use lake or a scoped build):

```bash
lake build <module>     # or:
lean --make verify/<slug>.lean
```

Then count `sorry` occurrences in the artifact:

```bash
grep -c "\\bsorry\\b" verify/<slug>.lean
```

- exit 0 + sorry-count == 0 → `pass`
- exit 0 + sorry-count > 0 → `partial`
- nonzero exit → `fail`

### `tlaplus`

**Prefer the TLA+ MCP tools when available** — `chat-tools-tlaplus_sany_parse`, `chat-tools-tlaplus_tlc_check`, `chat-tools-tlaplus_tlc_smoke`, `chat-tools-tlaplus_tlc_explore`. They run in-environment and avoid the brittleness of shelling out. Use `tool_search` to load them if they are listed as deferred.

Dispatch:

- `chat-tools-tlaplus_tlc_check` against `verify/<slug>.tla` with the declared model config:
  - "Model checking completed. No error has been found." → `pass`
  - State-space exhaustion / depth limit hit before completion → `partial` (note bound in commit body)
  - Error trace returned → `fail` (include the trace excerpt)
- If only `chat-tools-tlaplus_sany_parse` was run (syntax-only) → `partial`, note "syntax-only check" in commit body.
- If `chat-tools-tlaplus_tlc_smoke` was used → `partial`, note "smoke-test only, not full check" in commit body.

**Fallback (only if MCP tools unavailable):** shell out to local TLC.

```bash
tlc verify/<slug>.tla -config verify/<slug>.cfg
```

- "Model checking completed. No error has been found." → `pass`
- "Model checking interrupted" or partial-state-space → `partial`
- error trace → `fail`

**Always declare bounds.** TLC `pass` is _bounded_ model checking, not proof. Commit body must include the state-space size, depth bound, or model parameters used. A `pass` on a 4-process model is not a `pass` on the parameterized spec.

### `python-test`

All Python verification artifacts use **`uv`** with PEP 723 inline script metadata. No `pip install`, no virtualenv to manage, no `requirements.txt`. The dependency block lives at the top of `verify/<slug>.py`. uv provisions an ephemeral environment per run.

```bash
uv run --with pytest pytest verify/<slug>.py -q
```

(If the script declares `pytest` in its own PEP 723 dependency block, `uv run verify/<slug>.py` is enough. Prefer that.)

- exit 0 with no xfail/skip → `pass`
- exit 0 with xfail/skip → `partial`
- nonzero → `fail`
- `uv: command not found` → refuse with the install hint: `winget install astral-sh.uv` (Windows), `brew install uv` (macOS), or `curl -LsSf https://astral.sh/uv/install.sh | sh` (Linux). Do not fall back to bare `python` or `pip`.

### `python-numeric` / `sympy`

```bash
uv run verify/<slug>.py
```

The script declares its own dependencies in a PEP 723 header:

```python
# /// script
# requires-python = ">=3.11"
# dependencies = ["sympy>=1.12"]   # or numpy, scipy, mpmath, etc.
# ///
```

- exit 0 → `pass` (script must use `assert` or raise on mismatch; trust the script)
- nonzero → `fail`
  For `sympy`, additionally require the script to print one line beginning `EQUIV: ` confirming the symbolic identity it tested.

### `manual`

**Do not auto-pass.** Print the page's current `verification.notes` and ask the user explicitly:

> "Confirm manual re-attestation of <slug>? Reason on file: <notes>. Type 'yes, attested by <name>' to proceed."
> Only with explicit confirmation, set `last-result: pass`, `last-run: <today>`, and propose:

```
verify(<slug>): manual attest — <one-line reason>

Manually re-verified by <name> on YYYY-MM-DD.
```

### `none`

Refuse unless the page's `formalizable: false`. If `formalizable: false`, this command does nothing and tells the user verification is not applicable.

## Step 3 — Update frontmatter

Patch the page's `verification:` block:

```yaml
verification:
  method: <unchanged>
  artifact: <unchanged>
  last-run: YYYY-MM-DD
  last-result: <pass | partial | fail>
  notes: <unchanged unless method: manual, in which case append attestation line>
```

If result is `fail` and the page is currently `status: grounded`, **demote to `draft`** and surface this loudly. Do not silently leave a failing grounded page. Per AGENTS.md: demotions require a commit with a body stating the reason.

## Step 4 — Propose the commit

Single artifact:

```
verify(<slug>): <method> <result>

Tool: <lean|tlaplus|...>  Version: <if available>
Result: pass | partial (<reason>) | fail (<error excerpt>)
Page: <relative path>
Artifact: verify/<slug>.<ext>
```

Multi-target (`--all` / `--stale`): one summary commit referencing the run report:

```
verify(batch): <N pass / M partial / K fail / S skipped>

See verify/reports/run-YYYY-MM-DD.md.
```

And write that report file with per-target lines.

## Step 5 — Surface promotion implications

If a page changed from `not-run` or `fail` → `pass`, mention:

> "Verification gate now satisfies the `formalizable: true` requirement for grounded promotion. This is **necessary, not sufficient** — `/es-audit` (and for Forge work, `/es-falsify`) still must pass before promotion."

Do not say the page "is now eligible" or "is now grounded." Verification is one gate; the audit-time review is another.

If a page changed `pass` → `fail` and was `grounded`:

> "Demoting <page> from grounded to draft. Reason: verification fail at commit <sha>."

## Hard rules

- **Never claim a method that wasn't run.** If you ran SymPy, frontmatter says `sympy`, not `lean`.
- **Never auto-pass `manual`.** Explicit user attestation required.
- **Never hide `sorry`s.** Partial is partial.
- **Never delete a failing artifact.** Failed verifications are evidence; per AGENTS.md non-destructive history rule, they stay in git history.
- **Never invent the artifact.** If `verify/<slug>.*` does not exist, refuse and tell the user what to write — do not generate a "plausible" Lean file.
