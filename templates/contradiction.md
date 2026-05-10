# Contradiction Entry

Open contradictions are durable artifacts. They live in [wiki/contradictions.md](../wiki/contradictions.md) as append-only entries and may also live as standalone pages under `wiki/comparison/` for high-stakes disputes.

## Format

```markdown
## [YYYY-MM-DD] <short-title>

- **Status:** open | resolved | tabled
- **Domain:** [[domain page]]
- **Pages involved:** [[page A]], [[page B]]

### Position A

<one-paragraph statement of position A>
- Source: ^[raw/...] (Tier N)
- Source: [@cite-key]

### Position B

<one-paragraph statement of position B>
- Source: ^[raw/...] (Tier N)
- Source: [@cite-key]

### Where they actually disagree

<one paragraph isolating the load-bearing disagreement; not the surface disagreement>

### What would settle this

- Empirical: <experiment, dataset, observation that would discriminate>
- Mathematical: <theorem, calculation that would discriminate>
- Interpretive: <text, argument, reading that would discriminate>
- Or: this is a genuinely open question (mark explicitly)

### Current verdict

- Provisional lean: A | B | undecided
- Confidence: low | medium | high
- Reason: <one sentence>

### Resolution log

- [YYYY-MM-DD] <new evidence / argument / source>
- ...
```

## Rules

1. **No silent merges.** If two pages assert conflicting claims, you do not pick one and edit the other away. You open a contradiction entry.
2. **No fake resolution.** A contradiction is `resolved` only when you can name the discriminating evidence and the loser is demoted to `status: stale` with a pointer to the resolution.
3. **Tabled is honest.** A contradiction may be `tabled` if neither side has discriminating evidence yet. Tabling is not failure — it is precision about what you don't know.
4. **Backreferences mandatory.** Both pages involved must link to the contradiction entry under their **Counterarguments** section.

## Why this matters

Karpathy's wiki pattern flags contradictions; hyperresearch's adversarial critics surface them. Neither makes the contradiction itself a first-class durable artifact. RA does. An erudite's working knowledge is built on a paper trail of resolved disputes — without it, the wiki silently averages out into smooth, confident, wrong consensus.
