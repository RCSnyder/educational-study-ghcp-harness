---
name: es-contradiction
description: Log a detected contradiction between two grounded claims to wiki/contradictions.md
argument-hint: "<page-A> vs <page-B> on <claim>"
agent: "agent"
---

## Operating contract

Format per [templates/contradiction.md](../../templates/contradiction.md). Append-only register at [wiki/contradictions.md](../../wiki/contradictions.md). Patch the two pages involved to link back to the new entry.

# EDUCATIONAL STUDY — CONTRADICTION

## Step 1 — Identify the dispute

- Page A and Page B (or external source vs internal page).
- Quote the conflicting claims **verbatim** from each side, with `^[raw/...]` or `[@cite]` provenance.
- Confirm the disagreement is real (not a definitional mismatch). If definitional, redirect to `/es-distinguish` instead.

## Step 2 — Isolate the load-bearing disagreement

One paragraph. Strip away the surface disagreement until you find the actual point where the two positions diverge.

## Step 3 — Discriminator

What evidence — empirical, mathematical, or interpretive — would settle this? If none exists, mark `Status: tabled` honestly.

## Step 4 — Append entry

Add to `wiki/contradictions.md` using the template, newest on top.

## Step 5 — Backlink the pages

Patch (do not rewrite) Page A and Page B:

- Add the contradiction to each page's **Counterarguments** section as `[[contradictions#<entry-anchor>]]`.
- If either page was `status: grounded`, demote to `status: contested` until the contradiction is resolved.

## Step 6 — Log

Append to `wiki/log.md`:

```text
## [YYYY-MM-DD] contradiction | <short-title>
- Pages: [[A]], [[B]]
- Status: open | tabled
```

## Step 7 — Next action

Usually `/es-falsify <page>` on whichever page is the more confident claim, or `/es-fetch` for a discriminating source.

## Guardrail

Do not silently merge or pick a winner. The contradiction itself is a first-class artifact. Resolution requires named evidence, not editorial preference.
