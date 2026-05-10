# Educational Study GHCP Harness Flows

Educational Study GHCP Harness uses artifact-gated learning flows. The machine produces maps, source packs, drills, and reviews; the human reviews and demonstrates competence before advancing.

## Core loop

```text
Survey -> Ground -> Core -> Practice -> Audit -> Advance
```

## 1. Survey
Goal: get the continent, mountain ranges, and trailheads.

Commands:
- `/es-domain`
- `/es-atlas`
- `/es-map`
- `/es-substrate`
- `/es-scout`

Artifact:
- `maps/[domain]-atlas.md`

Gate:
- You can name the core objects, methods, evidence, and subfields without looking.

## 2. Ground
Goal: prevent hallucinated maps by tying claims to sources.

Commands:
- `/es-ground`
- `/es-canon`
- `/es-methods`
- `/es-sourcecrit`
- `/es-papertrail`

Artifact:
- `notes/[topic]-source-pack.md`

Gate:
- Major claims have source tiers and at least one textbook/review/primary anchor.

## 3. Core
Goal: find load-bearing fundamentals.

Commands:
- `/es-core`
- `/es-prereqs`
- `/es-extract`
- `/es-problemcore`
- `/es-textbook`

Artifact:
- `notes/[topic]-core.md`

Gate:
- You can state what is essential, what is deferrable, and what problems the core solves.

## 4. Practice
Goal: convert familiarity into usable skill.

Commands:
- `/es-practice`
- `/es-drill`
- `/es-problem`
- `/es-solve`
- `/es-project`

Artifact:
- `problems/[topic]-lab.md`

Gate:
- You can solve, explain, transfer, and critique representative tasks.

## 5. Audit
Goal: attack false confidence.

Commands:
- `/es-audit`
- `/es-claimledger`
- `/es-steelman`
- `/es-distinguish`
- `/es-review`

Artifact:
- `templates/claim-ledger.md` or `notes/[topic]-audit.md`

Gate:
- Unsupported claims are marked, counterarguments are named, and diagnostic failures are addressed.

## 6. Advance
Goal: pick the next trailhead.

Commands:
- `/es-goodenough`
- `/es-anti-rabbithole`
- `/es-next`
- `/es-roadmap`
- `/es-compress`

Artifact:
- `notes/[goal]-next.md`

Gate:
- The next action is concrete, bounded, and tied to a competence check.

## Better than a plain prompt pack

Educational Study GHCP Harness adds:

1. Short product namespace: `/es-*`.
2. Buddy router: `/es-buddy`.
3. Rigor profiles: `/es-rigor`.
4. Artifact gates: maps, source packs, problem labs, claim ledgers.
5. Explicit source tiers and hallucination controls.
6. Practice-first proof of learning.
7. Anti-rabbit-hole and good-enough commands to stop completionism.
