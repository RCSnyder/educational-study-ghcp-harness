# Wiki Integration: Atlas + Compounding Substrate

This doc ties Educational Study GHCP Harness (ES) to two adjacent patterns:

- **Karpathy's LLM-Wiki** — a three-layer pattern (`raw/` sources → `wiki/` LLM-maintained markdown → schema file) where the LLM does the bookkeeping and the human does the curation. Source: <https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f> (Tier 4 — gist; treat as design pattern, not authority).
- **hyperresearch** — a deep-research harness with a persistent SQLite-indexed markdown vault, patch-never-regenerate discipline, canonical-query-as-gospel, provenance breadcrumbs, and adversarial pre-commit critics. Source: <https://github.com/jordan-gibbs/hyperresearch> (Tier 4 — README; design pattern only).

Educational Study GHCP Harness already implements the **navigation** half of the philosophy (commands, flows, source tiers, claim ledger, reasoning primitives). What was missing is the **substrate** half: a persistent, inspectable, compounding artifact that survives across sessions. This doc specifies that layer without expanding the command surface beyond what is necessary.

---

## 1. Three layers (from Karpathy)

```text
raw/      immutable sources (PDFs, clippings, problem statements, transcripts)
wiki/     LLM-maintained markdown (entity, concept, source, comparison pages)
.github/  + AGENTS.md + docs/  — the schema (how the LLM writes the wiki)
```

Rules (non-negotiable):

- The LLM **never edits `raw/`**.
- The LLM **owns `wiki/`** but every claim must link back to a source in `raw/` or to a Tier 1–3 external citation.
- The schema lives in `AGENTS.md`, `.github/copilot-instructions.md`, and `docs/`. The LLM reads these every session.

The existing top-level dirs (`notes/`, `maps/`, `papers/`, `problems/`) keep their roles. `wiki/` is the _cross-cutting_ layer where entities and concepts that recur across topics get one canonical page (think: a page for "quasinormal modes" referenced from a Survey artifact, a Ground artifact, and a Practice artifact).

| Dir             | Owner                            | Status         | Contents                                     |
| --------------- | -------------------------------- | -------------- | -------------------------------------------- |
| `raw/`          | human                            | immutable      | uploaded sources, clippings, problem PDFs    |
| `wiki/`         | LLM (patch-only after grounding) | compounding    | entity / concept / source / comparison pages |
| `maps/`         | LLM                              | per-domain     | atlas snapshots from `/es-atlas`             |
| `notes/`        | LLM                              | per-topic      | core, source-pack, audit artifacts           |
| `papers/`       | LLM                              | per-paper      | `/es-readpaper` outputs                      |
| `problems/`     | LLM                              | per-topic      | problem-lab outputs                          |
| `wiki/index.md` | LLM                              | always current | catalog of all wiki pages                    |
| `wiki/log.md`   | LLM                              | append-only    | timeline of ingests, queries, lints          |

---

## 2. Three operations

### Ingest — `/es-ingest <source>`

A new source enters `raw/`. The agent:

1. Reads the source.
2. Discusses key takeaways with the user (one ingest at a time, supervised).
3. Writes / updates the relevant `wiki/` pages (entity, concept, summary).
4. Updates `wiki/index.md`.
5. Appends an entry to `wiki/log.md`.

A single source may touch 5–15 pages. The agent reports which pages it touched.

### Lint — `/es-lint`

A periodic structural health check across `wiki/`. Looks for:

- **Contradictions** between pages.
- **Stale claims** newer sources have superseded.
- **Orphan pages** with no inbound links.
- **Concepts referenced but missing their own page.**
- **Missing source tiers** on nontrivial claims.
- **Broken wikilinks.**
- **Unresolved CRITICAL markers** from prior `/es-audit` passes.

Lint **never edits**; it produces a report at `wiki/reports/lint-<date>.md` with proposed actions.

### Log — `/es-log [filter]`

Reads `wiki/log.md` and summarizes recent activity. With a filter (e.g. `ingest`, `query`, `lint`) returns only matching entries. Useful for `/es-continue`.

Log entry format (for grep-ability):

```text
## [YYYY-MM-DD] ingest | <source title>
## [YYYY-MM-DD] query  | <question>
## [YYYY-MM-DD] lint   | <issues found>
```

---

## 3. Load-bearing principles (from hyperresearch)

These are folded into the existing schema. They are not new commands.

1. **Markdown is truth.** No claim, link, or page lives only in a chat. If it matters, it is a file.
2. **Patch, never regenerate.** After a wiki page has been grounded once, subsequent updates are surgical edits with explicit reasons. Full rewrites require a `/es-update-atlas` pass and a log entry.
3. **Canonical query as gospel.** When a session starts with a research goal, persist the verbatim user prompt to `notes/<goal>-query.md` and have every subsequent step re-read it.
4. **Provenance breadcrumbs.** Every wiki page lists `suggested-by:` (the artifact or query that surfaced this page). Forms a rooted tree from seed sources; `/es-lint` flags disconnected components.
5. **Academic APIs before web search.** When grounding a research-grade claim, prefer Semantic Scholar / arXiv / OpenAlex / PubMed before generic web search. The harness already enforces tiers; this is a search-order rule.
6. **Adversarial pre-commit review.** Before promoting a wiki page from `draft:` to `grounded:` frontmatter, run `/es-audit` and `/es-steelman`. Critic findings either patch the page or are filed as CRITICAL in `wiki/reports/`.
7. **Lint gate on structure, not facts.** Lint catches missing tiers, broken links, orphan pages. It does not certify factual accuracy — that is the human's job.

---

## 4. Page format and provenance

See [templates/wiki-page.md](../templates/wiki-page.md) for the full template. Key conventions:

- **YAML frontmatter** with `type`, `tier`, `confidence`, `status`, `suggested-by`, `tags`, `updated`. Compatible with the Obsidian Dataview plugin.
- **Wikilinks** `[[Page Name]]` for cross-references (Obsidian-native).
- **Claim-level provenance** in the form `^[raw/source.pdf:42-58]` immediately after the claim. Inspired by hyperresearch's span citations.
- **Status lifecycle**: `stub` → `draft` → `grounded` → `stale`.
- **Confidence**: `low`, `medium`, `high`. Tied to source tier, not vibes.

---

## 5. Using the harness as an Obsidian vault

The repo is plain markdown + git. To use it as an Obsidian vault:

1. **Open the repo folder as an Obsidian vault.** No conversion needed.
2. Set `Files & links → New link format` to **Relative path to file** so wikilinks survive in plain git diffs.
3. Set `Attachment folder path` to `raw/assets/` so clipped images land in `raw/`.
4. Install **Dataview** to query the YAML frontmatter (e.g. `TABLE confidence, tier, updated FROM "wiki" WHERE status = "grounded"`).
5. Optional: install **Obsidian Web Clipper** to drop articles into `raw/` as markdown.
6. Use the **graph view** to spot orphans and hubs — these are exactly what `/es-lint` reports textually.

Workflow per Karpathy: **Obsidian on one side, Copilot Chat on the other.** You curate sources and ask questions; the agent maintains `wiki/` and the indexes; you watch the graph view update in real time.

---

## 6. What the harness gains, what it does not become

**Gains** (substrate level):

- Cross-session compounding instead of one-shot artifacts.
- Cross-topic deduplication via canonical entity pages.
- Auditable provenance per claim, not per document.
- A graph view that surfaces structural problems early.

**The harness does not become a research-paper generator.** The philosophy is unchanged: the wiki is a tool, not a proof of learning. Demonstrated competence still requires `/es-practice`, `/es-drill`, `/es-solve`, `/es-audit`, `/es-distinguish` on the user's part. A beautiful wiki with no practice trail is exactly the "learning-shaped entertainment" the philosophy warns against (§3 of [research-atlas-philosophy.md](research-atlas-philosophy.md)).

The wiki is the **map**. Practice artifacts under `problems/` are the **summit attempts**. Both are required.

---

## 7. What gets adopted, what gets rejected

| Pattern                                     | Source        | Adopted?         | Why                                                                                                                   |
| ------------------------------------------- | ------------- | ---------------- | --------------------------------------------------------------------------------------------------------------------- |
| Three-layer raw / wiki / schema             | LLM-Wiki      | ✅               | Matches the harness philosophy/flows split exactly.                                                                   |
| `index.md` + `log.md`                       | LLM-Wiki      | ✅               | Cheap, grep-able, no infra.                                                                                           |
| Obsidian as IDE                             | LLM-Wiki      | ✅               | Plain markdown already.                                                                                               |
| Patch-never-regenerate                      | hyperresearch | ✅               | Protects grounded claims from silent rewrites.                                                                        |
| Provenance breadcrumbs                      | hyperresearch | ✅               | Strengthens the existing claim ledger.                                                                                |
| Canonical query as gospel                   | hyperresearch | ✅               | Prevents goal drift across long sessions.                                                                             |
| Academic APIs before web search             | hyperresearch | ✅               | Refines tier discipline.                                                                                              |
| Adversarial critics                         | hyperresearch | ✅ (lightweight) | Reuses existing `/es-audit` + `/es-steelman`.                                                                         |
| 16-step pipeline                            | hyperresearch | ❌               | Violates philosophy §29 (over-mapping, premature optimization). The harness stays artifact-gated, not pipeline-gated. |
| SQLite cache layer                          | hyperresearch | ❌ for now       | Premature. The wiki is small. Revisit if size > ~hundreds of pages.                                                   |
| Multi-agent subagent roster                 | hyperresearch | ❌               | Out of scope for a Copilot prompt pack.                                                                               |
| Auto-batch ingest with no human in the loop | LLM-Wiki      | ❌               | Conflicts with the philosophy's anti-completionism: the human must curate.                                            |

---

## 8. Quick start with the wiki layer

```text
# 1. Drop a source in raw/ (paste, clip, or upload).
# 2. Ingest it.
/es-ingest raw/griffiths-ch3.pdf my goal is intro electrostatics

# 3. Health-check periodically.
/es-lint

# 4. Resume from log.
/es-log ingest
/es-continue

# 5. Promote a wiki page from draft to grounded.
/es-audit wiki/concept/laplace-equation.md
/es-steelman wiki/concept/laplace-equation.md
```

The rest of the harness (Survey, Ground, Core, Practice, Audit, Advance) is unchanged. The wiki layer sits underneath as durable memory.
