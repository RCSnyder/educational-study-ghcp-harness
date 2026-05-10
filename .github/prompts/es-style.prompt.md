---
name: es-style
description: Set or edit the vault's voice/style schema at notes/style.md
argument-hint: "[--show | --edit | --override <name>]"
agent: "agent"
---

## Operating contract

Schema lives at [notes/style.md](../../notes/style.md). All explainer commands (`/es-explain`, `/es-trail`, `/es-deepdive`, `/es-ingest`, `/es-readsource`, ...) read it first. Without a style schema, output drifts into model-default voice across sessions, which fragments the vault.

# EDUCATIONAL STUDY — STYLE

## Step 1 — Resolve mode

- `--show`: print current `notes/style.md` and stop.
- `--edit`: walk through the fields and patch.
- `--override <name>`: create or edit a named override block.
- No flag: print current and ask which mode.

## Step 2 — Walk the schema (if `--edit`)

For each section, ask the user. Suggest defaults from the template; do not overwrite without confirmation.

- **Voice:** register, person, hedging, density.
- **Diction:** jargon policy, math density, examples-first vs definitions-first, forbidden phrases.
- **Structure:** heading depth, target lengths per command, provenance density.
- **Defaults for specific commands:** which override applies to which command by default.

## Step 3 — Named overrides

For each override (`compact`, `narrative`, `proof`, custom), define when to use it. A page can opt in via frontmatter `style-override: <name>`.

## Step 4 — Apply downstream

- Patch `notes/style.md` with the new content. Append to a `## Change log` section at the bottom (the schema itself is the most-edited file in the vault).
- Do not mass-rewrite existing wiki pages to match the new style. Existing pages keep their voice; new content uses the new schema.

## Step 5 — Log

```text
## [YYYY-MM-DD] style | <field changed>
- From: <prev>
- To: <new>
```

## Step 6 — Next action

Usually `/es-stats` to see how many pages would be affected if you decide later to migrate, or `/es-explain <topic>` to test the new voice on a fresh explanation.

## Guardrail

A style schema with everything maxed ("rigorous, dense, full provenance, narrative, also compact") is incoherent. Force the user to choose tradeoffs explicitly.
