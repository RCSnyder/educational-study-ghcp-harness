# Academic APIs Before Web Search

A hard rule. For any research-grade claim, hit academic APIs **before** generic web search. They return citation-ranked canonical sources; web search returns derivative commentary.

This rule is from [hyperresearch](https://github.com/jordan-gibbs/hyperresearch) and folds into the harness's existing source-tier discipline ([source-discipline.md](source-discipline.md)).

## API roster

| API                            | Best for                                                    | Endpoint                                                     | Auth                                |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------ | ----------------------------------- |
| **Semantic Scholar Graph API** | citation graph, recommendations, abstracts                  | `https://api.semanticscholar.org/graph/v1/paper/search`      | optional key, free                  |
| **OpenAlex**                   | authorship, institutions, full text where OA, free metadata | `https://api.openalex.org/works`                             | none, polite-pool email recommended |
| **arXiv**                      | physics, math, CS, quant-bio, econ preprints                | `https://export.arxiv.org/api/query`                         | none                                |
| **bioRxiv / medRxiv**          | biology, medicine preprints                                 | `https://api.biorxiv.org/details/biorxiv/...`                | none                                |
| **PubMed eutils**              | biomedical literature                                       | `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi` | none, key for higher rate           |
| **Crossref**                   | DOI metadata, citation resolution                           | `https://api.crossref.org/works`                             | none                                |
| **CourtListener**              | US case law, court opinions                                 | `https://www.courtlistener.com/api/rest/v3/`                 | free key                            |
| **Library of Congress**        | primary US historical documents                             | `https://www.loc.gov/apis/json-and-yaml/`                    | none                                |
| **Internet Archive**           | books, periodicals, archived web                            | `https://archive.org/advancedsearch.php`                     | none                                |
| **HathiTrust**                 | digitized books                                             | `https://catalog.hathitrust.org/api/...`                     | none                                |
| **JSTOR Constellate**          | humanities + social science corpus                          | `https://constellate.org/`                                   | account                             |
| **OpenCitations**              | open citation data                                          | `https://opencitations.net/index/coci/api/v1`                | none                                |

## Search order

1. **Tier 0** — sources already in `raw/`. Always first.
2. **Tier 1–2** — academic APIs above, in domain-appropriate order.
3. **Tier 3** — university course pages, official documentation, syllabi (web search restricted to `.edu` / canonical domains).
4. **Tier 4** — general web. Encyclopedias, blogs, news.
5. **Adversarial sweep** — at least one search of the form "criticism of X" / "limitations of X" / "failure modes of X".

The agent must not skip steps 1–3 to reach step 4 faster.

## Practical workflow

```text
# 1. Ask the agent to fetch.
/es-fetch quasinormal modes ringdown black hole

# 2. Agent emits a search plan with API endpoints in priority order
#    and the literal queries to run.
# 3. Human runs the queries (or a helper script) and drops results into raw/.
# 4. Standard harness flow takes over.
/es-ingest raw/<new-source>
```

Why human-in-the-loop on the fetch step: the prompt pack does not execute network calls. It generates the queries, the user runs them. This keeps the system honest about what it actually did.

## Adversarial query templates

For any claim X, run all of:

- `"X" criticism`
- `"X" limitations`
- `"X" replication failure`
- `"X" controversy`
- `"X" alternative explanations`
- `"refuted X"` / `"X refuted"`

Log the strongest counter-source even if you disagree. Add it to the page's **Counterarguments** section.

## What counts as "fetched"

A source is fetched only when:

- The bytes live in `raw/` (or a stable URL with retrieval date).
- A `wiki/source/<id>.md` page exists with full bibliographic metadata.
- A BibTeX/CSL entry exists in `wiki/bib/`.
- The fetch is logged in `wiki/log.md` with the originating query.

Anything less is a rumor.

## Rate limiting and politeness

- Use the polite-pool email for OpenAlex (`?mailto=you@example.com`).
- Cache responses in `raw/api-cache/` so re-runs do not hit the API.
- Respect `robots.txt` for any HTML scraping.
- Never hammer paywalled sites you have not authenticated to.

## Anti-pattern: API as authority

APIs are plumbing, not authority. Citation count is a popularity metric, not a truth metric. Recency is a signal, not a guarantee. The tier system in [source-discipline.md](source-discipline.md) still governs how to weigh what comes back.
