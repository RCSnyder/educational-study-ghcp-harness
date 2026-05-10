# Source Position vs Reading

For history, philosophy, literature, theology, and the interpretive humanities. The discipline this template enforces: **what the source says** and **what you take it to mean** are two different artifacts, and a page that blurs them is broken.

## Frontmatter

```yaml
---
type: source-reading
source: [[source/...]] # the canonical source page
reader: <your name> # multi-curator wikis: who is reading
status: draft
tier: 5 # a reading is itself Tier 5 — your synthesis. The underlying source carries its own tier.
confidence: medium
suggested-by: ...
tags:
  - domain/...
  - school/...
---
```

## Body

```markdown
# Reading of <Source>

## Source identification

- Author, work, edition, date, location of passage in `raw/`.
- The source's own tier and provenance are on its source page; this is the **reading**.

## What the source says (close to the text)

Paraphrase in your own words but tightly. No interpretation here. No "the author means" — only "the author writes". If a passage is contested in its plain reading, flag it and quote both readings verbatim.

## What the source clearly does **not** say

Common misattributions, paraphrases that drift, claims widely associated with the source but not actually present.

## Historiographical / interpretive context

Whose readings of this source are dominant? Annales, Cambridge School, Frankfurt, Foucauldian, Straussian, etc. Name them; cite the canonical secondary works.

## Your reading

The interpretive move you are making. Be explicit:

- What is the textual evidence?
- What is the contextual evidence (other works by the author, intellectual milieu, biographical fact)?
- What assumption are you bringing that the text does not force?

## Rival readings

For each major rival reading:

- Reading: <one paragraph>
- Strongest defender: [@cite-key]
- Where it is more parsimonious than yours: ...
- Where it strains the text: ...

## What would force a revision of your reading

- A passage you have not yet considered: ...
- An archival find: ...
- A new reading by [@cite-key]: ...

## Status of the question

- Settled (well, "as settled as humanities disputes get"): ...
- Live debate: ...
- Stale debate (no new arguments in N years): ...

## Connections

- Compare with: [[reading/...]]
- Builds on: [[reading/...]]
- Disputes: [[reading/...]] — open contradiction at [[contradictions#...]]
```

## Rules

1. **The "What the source says" section must be defensible to a hostile reader who only has the text.** If anyone who reads the passage would dispute your paraphrase, it goes under "Your reading" instead.
2. **Tier of the reading is at most 5.** Your synthesis is your synthesis. The source's tier is the source's. Do not launder one into the other.
3. **Rival readings are required.** If you cannot reconstruct the strongest rival, you have not understood your own position.
4. **A reading without falsification conditions is rhetoric, not scholarship.**
