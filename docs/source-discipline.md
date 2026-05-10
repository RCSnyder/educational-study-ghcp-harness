# Source Discipline

The purpose of this repo is to help the user actually learn, not merely feel like they learned.

## Evidence tiers

**Tier 0 — User-provided source**  
Uploaded textbook pages, lecture notes, article text, problem statements, datasets, cases, primary documents, or screenshots.

**Tier 1 — Primary source**  
Original paper, statute, court opinion, historical document, canonical text, dataset, experiment report, field data, lab protocol, software documentation, or official standard.

**Tier 2 — Authoritative synthesis**  
Graduate textbook, academic handbook, review article, field survey, consensus report, meta-analysis, or authoritative monograph.

**Tier 3 — Teaching source**  
University lecture notes, official course pages, problem sets, instructor notes, reputable documentation.

**Tier 4 — Secondary explainer**  
Encyclopedia, reputable blog, public lecture, popular book, nontechnical explainer.

**Tier 5 — AI synthesis**  
Useful only as a hypothesis generator or organizing scaffold. Not authority.

## Claim labels

Every nontrivial claim should be labeled, implicitly or explicitly, as one of:

- Sourced fact
- Expert consensus
- Contested interpretation
- Pedagogical simplification
- Speculative synthesis
- Unknown / needs verification

## Citation rules

Do not invent citations.  
Do not invent page numbers.  
Do not invent canonical status.  
Do not invent consensus.  
Do not claim a source says something unless the source can be inspected.  
Do not call something current without current verification.  

When citation is required but unavailable, write:

> Source needed: [type of source needed]. Confidence: [low/medium/high].

## Claim ledger format

| Claim | Source needed | Source tier | Source found? | Confidence | Contested? | What would falsify it | Next verification action |
|---|---|---:|---|---|---|---|---|

## Domain-specific evidence

Different fields validate claims differently.

Physics/math:
- derivation
- proof
- experiment
- measurement
- simulation
- peer-reviewed paper
- textbook consensus

History:
- primary documents
- archaeology
- chronology
- source criticism
- historiography
- corroboration

Philosophy:
- argument reconstruction
- conceptual distinction
- counterexample
- textual interpretation
- rival positions

Law:
- statutes
- regulations
- cases
- precedent
- standards of review
- jurisdiction
- doctrinal tests

Biology/medicine:
- experiments
- assays
- model organisms
- clinical trials
- systematic reviews
- mechanisms

Economics/social science:
- models
- identification strategy
- data
- natural experiments
- robustness checks
- replication

Computer science:
- algorithms
- proofs
- complexity analysis
- benchmarks
- implementation
- ablation
- reproducibility

## Anti-hallucination prompts

Ask:

1. What are the strongest sources for this?
2. Is this settled, contested, or speculative?
3. What would falsify this claim?
4. What is the weakest link in the reasoning?
5. What practice task would prove I understand it?
