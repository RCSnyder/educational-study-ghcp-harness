---
name: es-iwrong
description: Add a doubt entry to notes/i-could-be-wrong.md — the most likely way current understanding is wrong
argument-hint: "<topic>"
agent: "agent"
---

## Operating contract

Persistent ledger of doubts at [notes/i-could-be-wrong.md](../../notes/i-could-be-wrong.md). The opposite of confidence theatre. Entries are not deleted; they are **resolved** with named evidence or **aged** into known limitations.

# EDUCATIONAL STUDY — IWRONG

## Step 1 — Pick the topic

- Argument is the topic or the wiki page in scope.
- Read the page's current `status:` and `confidence:`. A `confidence: high` page with no doubt entries is a target.

## Step 2 — Adversarial introspection

Ask the user (or generate, if invoked agentically):

- What is the **most likely** way you are wrong here?
- Why might you be wrong? — strongest version of the doubt, not the easiest.
- What would resolve this? — concrete check, source, calculation, experiment, or counterexample.

Refuse vague entries: "I might be misunderstanding the topic" is not a doubt; it's a fog. Push to specify.

## Step 3 — Append

Newest entries on top in `notes/i-could-be-wrong.md`. Schema:

```markdown
## <Topic> — <YYYY-MM-DD>

- **Most likely error:** <one sentence>
- **Why I might be wrong:** <2–3 sentences>
- **What would resolve this:** <concrete check>
- **Status:** open
- **Resolution:** _(filled in later)_
```

## Step 4 — Patch the related wiki page

If the doubt concerns a specific page, patch its **What would falsify** section with a link to this entry. Do not rewrite the page.

If the doubt is severe enough, demote the page's `confidence:`.

## Step 5 — Log

```text
## [YYYY-MM-DD] iwrong | <topic>
- Status: open
```

## Step 6 — Next action

- If the doubt is checkable now → `/es-falsify <page>` or `/es-fetch <discriminator>`.
- If the doubt requires experience over time → set a revisit trigger and move on.

## Guardrail

Generic doubts are forbidden ("I might be wrong about everything"). Each entry must name a specific error and a specific check. If the user cannot, the doubt is a feeling, not a doubt — surface that.
