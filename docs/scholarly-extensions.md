# Scholarly Extensions

Built on top of [research-atlas-philosophy.md](research-atlas-philosophy.md) and [wiki-integration.md](wiki-integration.md). These layers turn the harness from a learning navigator into an instrument an erudite can live with for years.

## Layer map

| Layer                | Purpose                              | Key commands                          | Key artifacts                                                                                                    |
| -------------------- | ------------------------------------ | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Bibliography         | Real citations, real export          | `/es-cite`                            | `wiki/bib/`, [templates/citation.md](../templates/citation.md)                                                   |
| Canonical query      | Goal does not drift                  | `/es-goal`                            | `notes/<slug>-goal.md`                                                                                           |
| Contradiction ledger | Open disputes are durable            | `/es-contradiction`                   | [wiki/contradictions.md](../wiki/contradictions.md), [templates/contradiction.md](../templates/contradiction.md) |
| Adversarial          | Test understanding, not fluency      | `/es-falsify`, `/es-explain-back`     | wiki page Counterarguments section                                                                               |
| Tribal knowledge     | Detect single-source folklore        | `/es-tribal`                          | `wiki/reports/tribal-<date>.md`                                                                                  |
| Calibration          | Track confidence vs outcomes         | `/es-calibrate`                       | `notes/calibration.md`                                                                                           |
| Decision journal     | Reasons for choices, reviewable      | `/es-decision`                        | [notes/decision-journal.md](../notes/decision-journal.md)                                                        |
| Could-be-wrong       | Anti-ossification                    | `/es-iwrong`                          | [notes/i-could-be-wrong.md](../notes/i-could-be-wrong.md)                                                        |
| Style / voice        | Aesthetic standards                  | `/es-style`                           | [notes/style.md](../notes/style.md)                                                                              |
| Lineage              | Intellectual genealogy               | `/es-lineage`                         | [templates/lineage.md](../templates/lineage.md)                                                                  |
| Marginalia           | Section-level glosses on raw sources | `/es-marginalia`                      | [templates/marginalia.md](../templates/marginalia.md)                                                            |
| Pedagogy             | Worked examples + transfer tests     | `/es-worked`, `/es-transfer`          | [templates/worked-example.md](../templates/worked-example.md)                                                    |
| Field layers         | Discipline-specific scaffolding      | `/es-textbook`, `/es-readpaper`, etc. | [docs/field-layers.md](field-layers.md)                                                                          |
| Source plumbing      | Academic APIs first                  | `/es-fetch`                           | [docs/academic-apis.md](academic-apis.md)                                                                        |
| Corpus health        | Visible state of the substrate       | `/es-stats`, `/es-graph`, `/es-lint`  | `wiki/reports/`                                                                                                  |
| Export               | Hand wiki content to other tools     | `/es-export`                          | output bundles                                                                                                   |

## Why these specifically

Three principles guide which extensions made the cut:

1. **Substrate over ceremony.** Each extension is a durable artifact (template, log, ledger), not a rhetorical move. If it disappears when the chat ends, it does not belong here.
2. **Adversarial-by-default.** Erudition is not refined fluency; it is the discipline of attacking your own positions. Falsify, contradict, calibrate, "I could be wrong" — these are the load-bearing additions.
3. **Compatibility with how scholars actually work.** BibTeX/CSL, Pandoc, Obsidian, plain markdown, git. Nothing proprietary. Nothing the user cannot inspect or version-control.

## What was deliberately not added

| Tempting addition                                | Why excluded                                                                                       |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| Spaced-recall scheduler                          | Obsidian Spaced Repetition plugin already does this. Out of scope for prompt pack.                 |
| Embedding index                                  | Premature at small scale. Markdown grep + Obsidian search is enough. Revisit at hundreds of pages. |
| PDF text extraction                              | Requires real code (pymupdf). Document the workflow; don't pretend to run it.                      |
| Multi-agent debate                               | Out of scope for a single-agent prompt pack.                                                       |
| Bayesian curriculum routing                      | Adds complexity that obscures the philosophy's anti-completionism principle.                       |
| Sigma-Guard / cohomology contradiction detection | Not reproducible from inside a prompt pack.                                                        |

## Reading order for these extensions

1. [academic-apis.md](academic-apis.md) — the source plumbing layer
2. [field-layers.md](field-layers.md) — discipline-specific scaffolding
3. Individual command prompts under [.github/prompts/](../.github/prompts/) — surgical entry points

## The compounding loop

```text
fetch → ingest → wiki page (draft)
   ↓
/es-falsify + /es-explain-back + /es-audit
   ↓
promote to grounded
   ↓
/es-calibrate (later, when outcomes known)
   ↓
contradictions, tribal claims, "I could be wrong" entries flow back into wiki/
```

The wiki gets better the more honestly you attack it.
