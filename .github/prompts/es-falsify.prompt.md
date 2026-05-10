---
name: es-falsify
description: Red-team a wiki page's core claim — generate the strongest case it is wrong
argument-hint: "<page>"
agent: "agent"
---

## Operating contract

Adversarial review. Goal: generate the steelmanned case **against** the page's core claim, before the page reaches `status: grounded`. Complementary to `/es-steelman` (which strengthens the page) — `/es-falsify` attacks it.

# EDUCATIONAL STUDY — FALSIFY

## Step 1 — Read the page

- Identify the **single core claim**. If there are multiple, ask which one to falsify and run separately for each.
- Note current `status:`, `confidence:`, and provenance density.

## Step 2 — Construct the attacks (all four)

1. **Empirical attack:** What observation, study, or measurement would refute the claim? Does it exist? If yes, cite.
2. **Logical attack:** Where does the argument's chain weakest link sit? Reconstruct it precisely.
3. **Definitional attack:** Could the claim be true only because terms were defined to make it so? Trace each load-bearing definition.
4. **Provenance attack:** What is the lowest-tier source the page relies on? Could the page survive without it?

## Step 3 — Best alternative position

Reconstruct, in 1–2 paragraphs, the strongest **rival** position a hostile expert would take. Cite if grounded sources exist; mark unsourced synthesis where they don't.

## Step 4 — Survival check

For each attack, mark:

- `survives` — page already addresses this; cite which section.
- `survives-after-patch` — page does not address this but a small patch would handle it; specify the patch.
- `damages` — substantive weakness; demote `confidence:` and surface in `wiki/reports/`.
- `lethal` — page should not be promoted; recommend `/es-contradiction` or rewrite.

## Step 5 — Write the audit

- Append to `wiki/reports/<page-slug>-falsify.md` with date, attacks, verdicts.
- Patch the target page's **Counterarguments / What would falsify** section with surviving attacks (do not rewrite the page).
- Update `confidence:` if damages found.

## Step 6 — Log + next action

- Log entry: `## [YYYY-MM-DD] falsify | <page> | verdict: survives | damages | lethal`.
- Next: `/es-audit <page>` if damages, or promote to grounded if survives cleanly.

## Guardrail

Refuse to write a falsify report that says "the claim survives all attacks" without naming at least one attack the page barely survives. If everything is fine, you did not actually try.
