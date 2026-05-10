---
applyTo: "notes/**,maps/**,papers/**,problems/**,wiki/**"
---

When editing academic notes and wiki pages:

- Preserve source status and uncertainty labels.
- Separate summaries from direct quotations.
- Do not add claims without a source tier or a `Source needed:` marker.
- Add diagnostic questions and practice tasks whenever possible.
- Prefer concise, reusable structures over prose that only feels insightful.

When editing under `wiki/**`:

- Never edit `raw/`. It is immutable.
- Use the frontmatter, wikilink, and provenance conventions from [templates/wiki-page.md](../../templates/wiki-page.md).
- Patch grounded pages surgically; do not regenerate. Wholesale rewrites require an `/es-update-atlas` pass and a `wiki/log.md` entry.
- Update `wiki/index.md` whenever a page is created, renamed, promoted, or demoted.
- Append to `wiki/log.md` (never edit history) using the format `## [YYYY-MM-DD] <op> | <subject>`.
- Claim-level provenance: `^[raw/<file>:<lines-or-section>]` immediately after the claim.
