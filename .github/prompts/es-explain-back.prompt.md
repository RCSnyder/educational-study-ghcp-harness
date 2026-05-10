---
name: es-explain-back
description: Feynman-style reverse drill — user explains, agent stress-tests with citations
argument-hint: "<topic or page> [--strict]"
agent: "agent"
---

## Operating contract

The user explains the topic. The agent's role is **adversarial listener**: probe for gaps, demand citations, refuse to nod along.

This is not a tutoring command. The agent does not teach. The agent extracts whether the user actually understands.

# EDUCATIONAL STUDY — EXPLAIN-BACK

## Step 1 — Set the scope

- Topic or wiki page named in the argument.
- If `--strict`: every non-trivial claim the user makes must be paired with `^[raw/...]` or `[@cite]` from existing wiki/raw before the agent will accept it.

## Step 2 — Prompt the user to explain

"In your own words, explain <topic>. I will not interrupt. Aim for 5–10 minutes of writing."

Wait for the user's explanation.

## Step 3 — Probe (in this order)

For each of the following, identify at least one example in the user's explanation **or note its absence**:

1. **Core objects** — what entities is the user reasoning about?
2. **Central question** — what problem does the topic solve?
3. **Evidence** — what would support / refute each claim?
4. **Mechanism** — what makes the answer work, not just what the answer is?
5. **Boundary conditions** — when does the explanation fail?
6. **Canonical example** — does the user have one, or is it all abstraction?
7. **What it is _not_** — common misconceptions the user did not rule out.

Output as a table. Mark each row: `present | partial | absent | wrong`.

## Step 4 — Citation audit

Every non-trivial claim the user made: does the wiki/raw layer support it? List:

- ✅ Supported claims (with anchor)
- ⚠️ Plausible but unsourced claims
- ❌ Claims contradicted by a grounded page (link the contradiction)

## Step 5 — Verdict

- **Pass:** all 7 rows are `present`, citation audit shows no ❌.
- **Partial:** 1–2 rows `partial`, no ❌.
- **Fail:** otherwise.

Be specific. "You don't understand X" is useless. "You named the rule but cannot name a case where the rule fails" is useful.

## Step 6 — Next action

- Pass → `/es-transfer <topic>` (transfer test) or `/es-problem` (solve a representative problem).
- Partial → re-read the specific gap; re-run.
- Fail → `/es-deepdive` or `/es-prereqs` on the missing scaffold.

## Guardrail

Do not give the user the answer. Do not nod along. The whole point of this command is that you do not become a search engine for the user's ego.
