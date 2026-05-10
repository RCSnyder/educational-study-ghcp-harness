---
name: es-snapshot
description: Tag the current HEAD as a citable position and write a one-paragraph summary file. The minimum publish primitive — turns a vault into a referenceable artifact.
argument-hint: "<short-slug>"
agent: "agent"
---

## Operating contract

`/es-snapshot` converts "I have a vault" into "I have a citable position to share." It is the **minimum publish primitive** — no rendering, no formats, no audience-specific shapes. Just a dated git tag and a summary file that tells a future reader (human or agent) what the snapshot represents.

Use when:

- you want to share the repo (publicly or privately) and the recipient needs a stable reference,
- you are about to start work that may diverge significantly and want a "last known good" anchor,
- you are about to invoke any future `/es-thread`, `/es-essay`, `/es-talknotes`, `/es-paper` (Wave 2 commands) — those will require a snapshot tag.

# EDUCATIONAL STUDY — SNAPSHOT

## Step 1 — Validate state before snapshotting

Refuse to snapshot if:

- the repo has **zero commits** (`git rev-list --count HEAD` is `0`). Snapshots tag a commit; there must be one. Tell the user to run a bootstrap commit first.
- there are uncommitted changes (`git status` is not clean),
- `STATE.md` is older than the most recent commit on the current branch (run `/es-state` first),
- the current branch is `explore/*` and the user has not explicitly confirmed they want a branch snapshot.

If validation fails, report exactly what failed and suggest the fix. Do not proceed.

## Step 2 — Compute the tag

Tag format: `snap/YYYY-MM-DD-<short-slug>`

Where `<short-slug>` is the user's argument, kebab-cased, ≤30 chars. Example: `snap/2026-05-09-laplace-bvp-v1`.

## Step 3 — Write the snapshot summary

Create `wiki/snapshots/<tag-without-prefix>.md` with this structure:

```markdown
---
type: snapshot
tag: snap/YYYY-MM-DD-<slug>
sha: <full 40-char commit sha>
date: YYYY-MM-DD
active-face: <Atlas | Dojo | Forge | mixed>
---

# Snapshot: <slug>

## What this snapshot represents

<one paragraph, ≤5 sentences. What was the user working on at this point? What state is the substrate in?>

## What is grounded at this point

- [page-name](../concept/page-name.md) — one-line summary

(List up to 10 most-relevant grounded pages. If more than 10, link to `wiki/index.md` filter.)

## What is contested or open

- contradictions: <count or one-line list>
- top gap-ledger entries: <count or one-line list>
- active `explore/*` branches: <count or list>

## Active goal at this snapshot

Name and link the active `notes/*-query.md`, or "none."

## What this snapshot is _not_

- Not a publication.
- Not a peer-reviewed claim.
- A dated position, citable as evidence of what the author knew/believed at this commit.

## How to read this snapshot

1. Start at `STATE.md` (regenerated at this tag).
2. Read this snapshot summary.
3. Then `wiki/index.md`.
4. Then specific `wiki/concept/` pages of interest.

## How to cite this snapshot

> <Author> (YYYY). _<Active goal title or repo name>_, snapshot `<tag>`, commit `<short-sha>`. <Repo URL>
```

## Step 4 — Propose the commit and the tag

Two commits and one tag, in order:

```bash
# 1. The summary file
git add wiki/snapshots/<file>.md STATE.md
git commit -m "doc(snapshot): write summary for <tag>"

# 2. The tag itself (annotated, signed if user has GPG configured)
git tag -a <tag> -m "Snapshot: <slug>

<one-paragraph description, same as in summary file>

Active face: <face>
Grounded pages: <count>
Open contradictions: <count>"
```

Do not run these yourself. Propose them; the user runs them.

## Step 5 — Optional: push the tag

If the user wants to publish, remind them:

```bash
git push origin <tag>
git push origin main  # if the snapshot commit is on main
```

Do not push for them.

## Hard rules

- **Never** retag an existing tag. Tags are immutable. If the snapshot needs revision, create a new tag (`snap/YYYY-MM-DD-<slug>-v2`).
- **Never** snapshot a dirty working tree.
- **Never** claim peer review, publication status, or external validation in the summary. The snapshot is _the author's dated position_, nothing more.
