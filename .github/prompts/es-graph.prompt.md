---
name: es-graph
description: Compute graph queries over the wiki (shortest path, centrality, islands, cycles) from markdown
argument-hint: "<query-type> [args]   e.g. path A B | central | islands | depends-on <page> | cycles"
agent: "agent"
---

## Operating contract

The wiki forms a directed graph: nodes are markdown pages, edges are `[[wikilinks]]` and `depends-on:` / `cited-by:` frontmatter. This command runs graph queries by reading markdown directly — no separate database, no indexing daemon. Slower than a graph DB; honest about that.

# EDUCATIONAL STUDY — GRAPH

## Step 1 — Parse the query

Supported query types:

- `path <A> <B>` — shortest path between two pages (concept routing, prerequisite chains).
- `central [--top N]` — pages with highest in-degree / betweenness.
- `islands` — connected components; surface isolated pages.
- `depends-on <page>` — transitive closure of `depends-on:` (math/proofs).
- `used-by <page>` — reverse: what depends on this page.
- `cycles` — cycles in `depends-on:` graph (a math wiki should have none).
- `relies-on <source>` — pages that would be invalidated if `<source>` were retracted.

## Step 2 — Build the graph (lazy)

- Walk `wiki/` and read frontmatter + body.
- Extract:
  - `[[wikilinks]]` (bidirectional concept edges)
  - `depends-on:` / `used-by:` / `cites:` (typed edges)
  - `relies-on:` (for empirical citation chains)
- Hold in working memory; do not write to disk unless the user asks for `--cache`.

## Step 3 — Run the query

- Print the result.
- For path queries, also print the **why this path**: name the load-bearing edge at each hop (concept handoff vs prereq vs citation).
- For centrality, name the top N and also the unexpected pages — pages that look central but are not, and vice versa.

## Step 4 — Diagnostic interpretation

Don't just print numbers. Interpret:

- An **island** of grounded pages is suspicious — likely missing a `suggested-by:` chain.
- A **cycle** in `depends-on:` is a bug. Surface it as CRITICAL in `wiki/reports/`.
- A **page with `cited-by:` count of zero** that is `status: grounded` is a candidate for compression.

## Step 5 — Next action

- Cycles or islands → `/es-lint` and `/es-audit` to repair.
- Path complete → use the path as the input to `/es-trail` for a learning sequence.

## Guardrail

Markdown-as-truth means this command is honest about cost: full vault traversal scales with vault size. For vaults > 1k pages, expect minutes, not seconds. Do not pre-emptively cache without the user asking.
