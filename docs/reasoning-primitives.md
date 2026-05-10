# Reasoning Primitives

Use these across academic domains.

## Universal moves

1. Define terms.
2. Identify the question.
3. Separate claim from evidence.
4. Identify assumptions.
5. Reconstruct the argument.
6. Find the warrant: why does the evidence support the claim?
7. Check counterexamples.
8. Compare rival explanations.
9. Test scope conditions.
10. Transfer the idea to a new case.
11. Identify what would change your mind.
12. Name what remains unknown.

## Argument audit

- Claim:
- Evidence:
- Warrant:
- Assumptions:
- Qualifiers:
- Counterarguments:
- Rebuttals:
- Scope conditions:
- What would falsify or revise this?

## Learning reality ladder

Do not confuse these:

1. I recognize this.
2. I can explain this.
3. I can use this.
4. I can solve with this.
5. I can transfer this.

## Problem-solving discipline (Polya)

For any problem solved inside this harness — exercise, derivation, proof, case brief, source-position argument, model-building, etc. — use Pólya's four-phase scaffold from _How to Solve It_. The default LLM tendency is to leap from problem statement to plan and skip _Understand_ and _Look back_; those are exactly the two phases that prevent fluent-but-wrong answers, so they are mandatory here.

### Four phases

1. **Understand the problem.** What is the unknown? What are the data? What is the condition? Restate the problem in your own words. Draw a figure or notation if useful. Identify what is given vs. what is to be found.
2. **Devise a plan.** Have you seen a related problem? Can you restate it in a known form? Can you specialize, generalize, or solve a simpler analogue first? What principle, theorem, doctrine, or method applies?
3. **Carry out the plan.** Execute step by step. Check each step. Do not skip load-bearing moves. If the plan fails, return to phase 2 — do not patch around the failure.
4. **Look back.** Does the answer satisfy the condition? Sanity / dimensional / boundary / limiting-case check. Could you derive it differently? Where else does this method apply? What does this _not_ prove?

### Pólya question list (use during phases 1–2)

- What is the unknown?
- What are the data?
- What is the condition?
- Is the condition sufficient to determine the unknown? Redundant? Contradictory?
- Have you seen the same problem in a slightly different form?
- Do you know a related problem? A simpler analogous problem?
- Can you restate the problem? Can you restate it differently?
- Can you imagine a more accessible related problem? More general? More specific? Analogous?
- Can you solve part of the problem? Drop a condition; how does the unknown move?
- Did you use all the data? All the conditions?

### Mapping to harness commands

- Phase 1 (_Understand_) is the front-matter on `problems/*.md` and the entry block of any `/es-solve` attempt.
- Phase 2 (_Plan_) is where `/es-transfer` and "have you seen a related problem" prompts trigger.
- Phase 3 (_Carry out_) is the body of `/es-solve` and `/es-worked`.
- Phase 4 (_Look back_) is mandatory and is what `/es-explain-back`, `/es-falsify`, `/es-iwrong`, and `/es-verify` extend over the longer arc.

A solution that lacks an explicit _Look back_ section is incomplete by harness convention. Do not let the agent omit it. 6. I can critique this. 7. I can teach this accurately with sources.

A good learning system should move you up the ladder.
