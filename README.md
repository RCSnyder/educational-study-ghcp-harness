# educational-study-ghcp-harness

**For accelerated, problem-first study of any rigorous domain — get to real understanding fast, without fooling yourself that you have it.** A prompt pack for VS Code + GitHub Copilot that lets you name the problem you actually want to solve, then navigate the academic terrain around it with discipline: enough depth to be competent, no more than your goal requires, with an audit trail that catches you when fluent AI prose tries to pass for understanding.

It is **markdown plus git plus slash commands**. No server, no database, no install beyond cloning. Everything the system knows lives in files in this folder; the audit trail is your `git log`.

## Who this is for

Anyone with a real problem in a rigorous domain who needs to learn _enough_ to solve it — and refuses to spend ten years on prerequisites first, but also refuses to outsource the thinking to a chat assistant.

The harness is for people who reject both extremes:

- **The completionist trap**: "I can't start until I've worked through all of analysis, then topology, then differential geometry, then…" — an infinite prerequisite ladder that is really procrastination wearing a respectable hat.
- **The chatbot trap**: "I'll just ask the LLM to explain it" — fluent, confident, frictionless, and almost entirely undurable. Recognition without competence.

Between those is the actual job: identify what you need to know to solve _this_ problem, learn it deeply enough to use it, verify you can actually use it, and stop. Then iterate. The harness instruments that loop. It assumes you have AI tools available and refuses to pretend you don't — but it forces you to use them as scouts and drilling partners, not as a substitute for understanding.

Concretely, it fits:

- **Researchers and practitioners** who need to absorb an unfamiliar field _because the problem demands it_, not because they want a credential. You want strategic fluency in just-enough territory, not a degree.
- **Graduate students** ingesting tens or hundreds of papers in a new subfield who need provenance, contradictions, and an audit trail an advisor can read.
- **Autodidacts** working through real material who want a structured trail of what they actually understood vs. what they only nodded at — and who want to know when they are _good enough for their next target_, so they can move.
- **Source-driven scholars** (lawyers, historians, theologians, classicists) who need claim-level provenance and a contradictions register, not generic chatbot summaries.
- **Practitioners formalizing tacit knowledge** — engineers writing the first internal handbook for a system, analysts auditing their own decision history, anyone whose competence has outrun their ability to defend it.

If you want a tutor that makes you _feel_ smart, use a chat assistant directly. If you want an instrument that shortens the path to real competence on a problem you actually have — and tells you when you are fooling yourself — use this.

## What it does, in one paragraph

You pin a verbatim study goal — _the problem you actually want to solve_, with explicit "what done looks like" and "out of scope" sections. The system uses that goal as gospel: every command re-reads it, and "good enough" is always goal-relative, never field-relative. You drop sources into `raw/`. `/es-ingest` extracts claims into a `wiki/` of patch-edited markdown pages with provenance markers. `/es-prereqs` distinguishes real prerequisites from fake ones; `/es-anti-rabbithole` and `/es-goodenough` collapse exploration into action. `/es-problem` and `/es-solve` make you do the work. `/es-falsify` and `/es-audit` attack a page before it gets promoted from `draft` to `grounded`. `/es-explain-back` verifies you can reconstruct the idea unaided. `/es-iwrong` logs doubts; `/es-stats` flags weeks where you read but did not practice. Every step is one git commit with a typed message; `git log` is the canonical history. The metaphor — borrowed from [`docs/research-atlas-philosophy.md`](docs/research-atlas-philosophy.md) — is _continent → mountain ranges → trailheads_: get oriented, find the trailhead nearest your problem, climb only as high as the problem requires, and know it when you have arrived.

---

## Table of contents

- [educational-study-ghcp-harness](#educational-study-ghcp-harness)
  - [Who this is for](#who-this-is-for)
  - [What it does, in one paragraph](#what-it-does-in-one-paragraph)
  - [Table of contents](#table-of-contents)
  - [Why this exists](#why-this-exists)
  - [Three faces: Atlas, Dojo, Forge](#three-faces-atlas-dojo-forge)
  - [What this actually does](#what-this-actually-does)
  - [What this is not](#what-this-is-not)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [The mental model](#the-mental-model)
  - [Source tiers](#source-tiers)
  - [Your first session — concrete walkthrough](#your-first-session--concrete-walkthrough)
    - [1. Pin a goal verbatim](#1-pin-a-goal-verbatim)
    - [2. Drop in a source](#2-drop-in-a-source)
    - [3. Ingest it](#3-ingest-it)
    - [4. Practice before reading more](#4-practice-before-reading-more)
    - [5. Audit before promoting](#5-audit-before-promoting)
    - [6. Check yourself](#6-check-yourself)
  - [Daily use](#daily-use)
  - [Command catalog (overview)](#command-catalog-overview)
  - [Git as the state machine](#git-as-the-state-machine)
  - [Commit message convention](#commit-message-convention)
  - [Optional: open as an Obsidian vault](#optional-open-as-an-obsidian-vault)
  - [Folder map](#folder-map)
  - [Out of scope (on purpose)](#out-of-scope-on-purpose)
  - [Troubleshooting](#troubleshooting)
  - [Further reading](#further-reading)
  - [Rule of use](#rule-of-use)
  - [License](#license)

---

## Why this exists

Most rigorous problems sit on top of an academic field whose full breadth would take a decade to master. Most people who hit one of those problems then face two bad options:

1. **Do the full degree** — work the canonical sequence end to end, accumulating prerequisites until the original problem has aged out of relevance.
2. **Skip to the chatbot** — ask an LLM to "explain the intuition" until something feels obvious, and call that understanding.

Both fail, in opposite directions. The first treats the field as an obligation; the second treats it as decoration. Neither one tracks whether you can actually _use_ the material to solve the thing you came for.

There is a third option, and it is the one this system is built around: **pick the problem you actually want to solve, then explore the academic territory around it with discipline — going deep where the problem demands depth, going wide only where the problem demands breadth, and stopping the moment you can demonstrate the competence the problem requires.** This is **strategic fluency**: navigational power, always _goal-relative_. "Good enough" means good enough for your next target, not for the field as a whole. ("Good enough is goal-relative" is §7 of [`docs/research-atlas-philosophy.md`](docs/research-atlas-philosophy.md); the anti-rabbit-hole governor is §23.)

The reason this third option is rare in practice is that it is _harder_ than either alternative. It requires you to:

- **Tell recognition apart from competence.** "I have seen this before" and "I can solve, derive, reconstruct, or critique with this" feel similar from the inside. They are not the same. Most AI-assisted learning collapses the distinction; the harness refuses to.
- **Stop when the goal is met.** The completionist instinct says "one more chapter." The harness asks `/es-goodenough <goal>` and answers honestly.
- **Sit with confusion in the right places.** Some confusion is signal — the place where the field's load-bearing structure actually is. Other confusion is noise from a fake prerequisite. The harness helps separate them with `/es-prereqs` and `/es-anti-rabbithole`.
- **Catch yourself when fluent prose is doing the work.** AI makes this failure mode dramatically worse: fluent explanations are exactly what trigger the false-completion signal. `/es-explain-back`, `/es-falsify`, `/es-audit`, and `/es-iwrong` exist to break that signal.

The system is built to refuse **learning-shaped entertainment**: fluent explanations, beautiful taxonomies, and confident-sounding maps that produce the _feeling_ of orientation without the _fact_ of it (philosophy doc §3). It does this by forcing a working distinction between:

- **recognition** ("I have seen this before"),
- **explanation** ("I can describe this in my own words"),
- **competence** ("I can solve, derive, reconstruct, or critique with this"),
- **transfer** ("I can use this in a case I have never seen").

Concretely, the loop the commands enforce is:

```bash
identify the real problem
   ↓
map enough terrain to find a trailhead
   ↓
extract the load-bearing core for that trailhead
   ↓
practice on representative problems
   ↓
adversarially audit before trusting any page
   ↓
check yourself by explaining back unaided
   ↓
stop when good enough for the goal — or repeat with a sharper goal
```

`/es-goal` pins the problem. `/es-domain`/`/es-atlas`/`/es-frontier-cones` map the terrain. `/es-prereqs` and `/es-roadmap` find the trailhead. `/es-core` and `/es-primitives` extract the load-bearing pieces. `/es-problem` → `/es-solve` → `/es-worked` → `/es-transfer` build competence. `/es-falsify`, `/es-audit`, `/es-tribal`, `/es-contradiction` are the adversarial gates. `/es-explain-back` is the unaided-reconstruction check. `/es-goodenough`, `/es-anti-rabbithole`, `/es-next` keep you moving toward the actual problem instead of grazing forever.

The harness is not a shortcut around real understanding — there is no such shortcut. It is an instrument that **compresses the path** by removing the two big time-sinks (completionist study and confident-sounding fluff) and leaves only the work that actually transfers competence. Use it, and a problem that would have taken years of generic prep can often be reached in weeks of targeted study. Misuse it, and it becomes another way to feel busy. The difference is whether you let it audit you.

Full rationale: [`docs/research-atlas-philosophy.md`](docs/research-atlas-philosophy.md). Read it once before customizing the system.

## Three faces: Atlas, Dojo, Forge

Educational Study GHCP Harness is one substrate (a markdown vault tracked in git) with three operational faces. The faces are diagnostic categories, not separate tools — every command belongs to one face, and `/es-buddy` infers which face you are in from current repo state and routes you accordingly.

- **Atlas** — _map_. Mode: wander. For orientation. Light commits, no branches. Commands like `/es-domain`, `/es-atlas`, `/es-substrate`, `/es-frontier-cones`, `/es-anti-rabbithole`, `/es-goodenough`. Fights _learning-shaped entertainment_ and infinite-prerequisite loops.
- **Dojo** — _train_. Mode: study. For competence-building. Real commits with provenance, gap ledger, audits before promoting pages. Commands like `/es-problem`, `/es-solve`, `/es-drill`, `/es-worked`, `/es-transfer`, `/es-iwrong`, `/es-explain-back`, `/es-calibrate`, and the compounding loop `/es-reach`. Fights passive fluency.
- **Forge** — _make_. Mode: synth. For frontier work. Branched by default (`explore/<topic>`); adversarial review (`/es-falsify`, `/es-audit`) before merging to `main`. Commands like `/es-falsify`, `/es-steelman`, `/es-contradiction`, `/es-blend`, `/es-tribal`, `/es-lineage`. Fights sloppy novelty.

The **buddy diagnoses which face you need and routes you there.** Run `/es-buddy <question>` whenever you don't know what to do next; it reads `git log`, `STATE.md`, and the active goal, and returns the lightest appropriate next move. Full design: [`docs/three-faces.md`](docs/three-faces.md).

## What this actually does

You pin a study goal or research question. The system gives Copilot a structured set of behaviors that:

1. **Map the terrain at three scales** — continent (the field), mountain ranges (subfields and traditions), trailheads (concrete entry points where you can do real work).
2. **Force source separation** between what is sourced fact, expert consensus, contested interpretation, pedagogical simplification, speculative synthesis, and unknown / needs verification (see [Source tiers](#source-tiers)).
3. **Persist every non-trivial output as a markdown file** you can edit, search, and version.
4. **Build a compounding wiki** under `wiki/` where each page carries `^[raw/...]` provenance markers and YAML frontmatter you can audit.
5. **Refuse to mark a page as `grounded`** until it has been adversarially reviewed (`/es-falsify`, `/es-audit`, `/es-tribal`).
6. **Govern against rabbit holes and fake prerequisites.** `/es-anti-rabbithole`, `/es-goodenough`, and `/es-next` collapse exploration into one concrete next action.
7. **Use git as the state machine** — every command's output is committed with a conventional message, so `git log` is the canonical history of what the agent did and why.
8. **Expose ~70 slash commands** (`/es-*`) covering the loop of _Survey → Ground → Core → Practice → Audit → Advance_, plus bibliography, contradictions, decision journaling, intellectual lineage, and discipline-specific layers (math proofs, legal case briefs, empirical studies, humanities source-readings).

The point is not to feel oriented. The point is to **demonstrate** orientation by naming the core objects, stating the central questions, identifying the evidence, reconstructing the reasoning, solving representative problems, transferring the idea to a new case, and naming what you still do not know. That seven-point test is the only test the system actually trusts.

## What this is not

Be specific so you do not pick the wrong tool:

- **Not a RAG app.** No embeddings, no vector store, no PDF/OCR runtime. If you drop a PDF into `raw/`, the agent cannot read its contents. You are responsible for getting text out.
- **Not an autograder.** Lint and audit commands check structure (does the page have a falsification clause? a counterargument? a citation?) — never factual correctness.
- **Not a chat history tool.** If a claim only lives in chat, it does not exist in this system. Get it into a file and commit it.
- **Not a one-click study buddy.** It works because you commit to running the audit and practice commands, not just the survey commands. Without practice, this is a more expensive way to feel busy.

## Requirements

- VS Code (recent — 1.90+ recommended).
- GitHub Copilot extension with Copilot Chat enabled, on a plan that supports custom prompts.
- Git installed locally. The system uses git as its state and history layer; see [Git as the state machine](#git-as-the-state-machine).
- [Git LFS](https://git-lfs.com/) installed locally if you intend to drop PDFs, scans, audio, video, or datasets into `raw/`. The repo's `.gitattributes` already routes those file types through LFS so binaries do not bloat git history; markdown, JSON, YAML, and BibTeX stay in regular git so diff and grep keep working.
- Optional but recommended: Obsidian, for graph view and Dataview queries over the same files.

No package installs. No language runtime. No daemon.

## Setup

```bash
git lfs install                                    # one-time, per machine
git clone <this-repo> educational-study-ghcp-harness
cd educational-study-ghcp-harness
code .
```

If you skipped `git lfs install` and later add a PDF to `raw/`, run it then and re-add the file. LFS is only needed for binaries; the harness itself ships pure markdown and JSON.

In VS Code:

1. Open Copilot Chat (sidebar or `Ctrl+Alt+I`).
2. Confirm Copilot Chat sees the workspace prompts: type `/` and you should see entries beginning with `es-` (e.g. `/es-buddy`, `/es-domain`, `/es-ingest`).
3. If you do not see them, confirm `.github/prompts/*.prompt.md` and `.github/copilot-instructions.md` are recognized — these are loaded by Copilot Chat automatically when present in a workspace.

Optional first commit if this is a fresh clone you intend to use as your own vault:

```bash
git add -A
git commit -m "chore(bootstrap): initialize educational-study-ghcp-harness vault"
```

You can now use the system. There is nothing else to install.

## The mental model

The repo has three layers and a few support folders. Every layer is plain markdown, and git tracks all of it.

```bash
raw/              Sources you copied or pasted in.        Read-only for the agent.
wiki/             The agent's compounding knowledge base. Patch-edited; never wholesale-rewritten.
notes/, papers/,  Per-topic working files: study briefs,  Edited freely.
problems/, maps/  paper notes, problem labs, atlases.
```

Three load-bearing rules govern the layers:

1. **Markdown is truth, git is history.** If a fact matters, it lives in a file. If a transition matters, it lives in a commit. Nothing important lives only in chat output.
2. **Patch, never regenerate.** Once a `wiki/` page reaches `status: grounded`, the agent makes surgical edits with reasons. Wholesale rewrites are escalated, not silently performed. Reversal is `git revert`, not deletion.
3. **Provenance is mandatory.** Every non-trivial claim in `wiki/` carries either a `^[raw/path:lines-or-section]` anchor (for sources you have locally) or a `[@cite-key]` reference (resolved via `wiki/bib/<key>.md`).

Layered on top of the file substrate is a **learning loop** the commands enforce:

```bash
Survey  →  Ground  →  Core  →  Practice  →  Audit  →  Advance
```

Each step has commands attached (see [Command catalog](#command-catalog-overview)). The loop is **spiral, not linear** — you do not finish prerequisites before starting; you learn enough to attempt a real problem, hit an obstacle, learn the missing tool, and return. `/es-stats` flags it when you have surveyed without practicing, ingested without auditing, or read without solving.

Read [AGENTS.md](AGENTS.md) once. It is the contract the agent operates under. Read [`docs/research-atlas-philosophy.md`](docs/research-atlas-philosophy.md) once. It is _why_ the contract is shaped this way.

## Source tiers

The agent classifies every non-trivial claim against a source tier so confident-sounding text cannot smuggle in unsourced synthesis. Full definitions live in [`docs/source-discipline.md`](docs/source-discipline.md); the short form:

| Tier       | What                                                                                | Treat as                         |
| ---------- | ----------------------------------------------------------------------------------- | -------------------------------- |
| **Tier 0** | User-provided source dropped into `raw/` (textbook page, PDF, problem set)          | Local ground truth               |
| **Tier 1** | Primary source — original paper, statute, court opinion, dataset, canonical text    | Authoritative for that claim     |
| **Tier 2** | Authoritative synthesis — graduate textbook, handbook, peer-reviewed review article | Strong consensus                 |
| **Tier 3** | Teaching source — university lecture notes, reputable course pages, official docs   | Pedagogically strong, contextual |
| **Tier 4** | Secondary explainer — encyclopedia, blog, video, popular book                       | Useful, not load-bearing         |
| **Tier 5** | AI synthesis (this agent included)                                                  | Hypothesis only, never authority |

A `wiki/` page marked `status: grounded` must rest on Tier 0–2 evidence with `^[raw/...]` or `[@cite-key]` anchors at the claim level. Tier 4–5 claims must be labelled as such or removed by `/es-falsify` and `/es-tribal`. The agent **never invents** citations, page numbers, canonical status, consensus, or research trends; if a source is unavailable it must say so and label the claim _unsourced synthesis_ or _tentative_.

## Your first session — concrete walkthrough

Here is the smallest useful loop. Do this once end-to-end before customizing.

### 1. Pin a goal verbatim

Open Copilot Chat. Type:

```bash
/es-goal I want to understand the Laplace equation well enough to solve standard boundary-value problems in 2D and 3D for a CS-background reader.
```

The agent writes `notes/laplace-2d-3d-bvp-query.md` with your verbatim goal, frontmatter, and a "what done looks like" skeleton. **You** fill in the _what done looks like_ and _out of scope_ sections. The agent should not infer them.

Commit:

```bash
git add notes/
git commit -m "goal(laplace-bvp): pin Laplace BVP study goal"
```

### 2. Drop in a source

Save the relevant chapter (PDF text export, or a markdown copy) to `raw/`. For example: `raw/griffiths-em-3.1.md`. The agent never edits `raw/`; it only reads from it.

```bash
git add raw/
git commit -m "raw(griffiths-em): add §3.1 chapter text"
```

### 3. Ingest it

```bash
/es-ingest raw/griffiths-em-3.1.md for goal notes/laplace-2d-3d-bvp-query.md
```

The agent proposes:

- Which `wiki/` pages it would create or patch (e.g. `wiki/concept/laplace-equation.md`, `wiki/concept/separation-of-variables.md`).
- The exact diffs.
- A line for `wiki/index.md`.
- A log entry for `wiki/log.md`.
- A proposed commit message.

You approve. After the agent applies the changes:

```bash
git add wiki/
git commit -m "ingest(griffiths-em-3.1): laplace-equation, separation-of-variables"
```

### 4. Practice before reading more

The system flags it explicitly if you ingest twice without practicing. Run:

```bash
/es-problem solve Laplace's equation in a rectangular box with grounded sides and one side held at V₀
```

The agent gives you the problem; you attempt it; you paste your attempt:

```bash
/es-solve <your attempt>
```

You write the solution to `problems/laplace-rect-box.md` and commit:

```bash
git add problems/
git commit -m "practice(laplace): solve rect-box BVP"
```

### 5. Audit before promoting

When you think a page is solid:

```bash
/es-falsify wiki/concept/laplace-equation.md
/es-audit wiki/concept/laplace-equation.md
```

If both pass, the page is promoted from `status: draft` to `status: grounded`.

```bash
git add wiki/
git commit -m "audit(laplace-equation): promote to grounded

- /es-falsify: survives all four attacks
- /es-audit: provenance density 0.83
- counterargument section now links contradiction #3"
```

### 6. Check yourself

```bash
/es-explain-back laplace equation
```

You explain it to the agent without looking at the page. The agent challenges every claim and reports gaps. This is the most important step — skip it and the system loses most of its value.

Commit any newly-discovered gaps as `iwrong` entries:

```bash
/es-iwrong laplace equation
```

```bash
git add notes/i-could-be-wrong.md
git commit -m "iwrong(laplace): doubt about uniqueness without boundary regularity"
```

That is the loop. Everything else is variations and discipline-specific extensions.

## Daily use

After the first session, you mostly use:

- `/es-buddy <question>` — concierge that diagnoses your active face (Atlas/Dojo/Forge) and routes to the right command. Use this when in doubt.
- `/es-state` — regenerates `STATE.md` at the repo root: a short, legible snapshot of active goals, recent commits, open contradictions, top gap-ledger entries, and active branches. Run it after any substantive session.
- `/es-continue` — picks up wherever the last session ended (reads `git log` and `wiki/log.md`).
- `/es-next` — names the single highest-value next action given current state.
- `/es-reach` — _Dojo_. Reads the gap ledger and proposes the smallest drill that closes the highest-leverage gap, plus the hardest problem you can productively engage today. The Gowers loop.
- `/es-snapshot <slug>` — tags HEAD as a citable position and writes a one-paragraph summary file. The minimum publish primitive.
- `/es-blend <A> + <B>` — _Forge_. Conceptual blending: produces a candidate concept by structured integration of two input spaces. Branched by default.
- `/es-stats` — corpus health dashboard: thinness, drift, practice-to-consumption ratio.
- `/es-lint` — structural check across the whole vault.
- `/es-anti-rabbithole` / `/es-goodenough` — _Atlas_. Stop conditions; _good enough_ is goal-relative.

A healthy weekly rhythm looks like: ingest → ingest → practice → audit → ingest → practice → reflect (`/es-iwrong`, `/es-decision`). If you ever realize you have ingested four times with no practice, `/es-stats` will say so. Every session should end in **one concrete next action**, not ten options — that is what `/es-next` enforces.

## Command catalog (overview)

The full table with every command and its `es-` alias is in [docs/command-catalog.md](docs/command-catalog.md). At a glance:

| Group                        | What it does                                                                                                                                                                 |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Orientation**              | Survey domains, build atlases, find trailheads. `/es-domain`, `/es-atlas`, `/es-substrate`, `/es-frontier-cones`.                                                            |
| **Grounding**                | Source discipline, paper trails, close reads. `/es-ground`, `/es-canon`, `/es-sourcecrit`, `/es-readsource`, `/es-readpaper`.                                                |
| **Core extraction**          | Strip a topic to its load-bearing pieces. `/es-core`, `/es-prereqs`, `/es-primitives`, `/es-problemcore`, `/es-roadmap`.                                                     |
| **Practice**                 | Drill, problems, projects, reflection. `/es-practice`, `/es-drill`, `/es-problem`, `/es-solve`, `/es-project`, `/es-reflect`.                                                |
| **Critical reasoning**       | Audit, ledger, compare, steelman, debate. `/es-audit`, `/es-claimledger`, `/es-compare`, `/es-steelman`, `/es-debates`.                                                      |
| **Control / advancement**    | Stop conditions and rabbit-hole limits. `/es-goodenough`, `/es-anti-rabbithole`, `/es-next`, `/es-compress`, `/es-update-atlas`, `/es-rigor`.                                |
| **Wiki substrate**           | Move material in and around the vault. `/es-ingest`, `/es-lint`, `/es-log`, `/es-goal`, `/es-fetch`, `/es-marginalia`, `/es-graph`, `/es-stats`, `/es-lineage`, `/es-style`. |
| **Bibliography & export**    | Citations and offline bundles. `/es-cite`, `/es-export`.                                                                                                                     |
| **Adversarial**              | Pre-promotion stress tests. `/es-falsify`, `/es-contradiction`, `/es-tribal`, `/es-explain-back`.                                                                            |
| **Pedagogy**                 | Worked examples and transfer tests. `/es-worked`, `/es-transfer`.                                                                                                            |
| **Reflection / calibration** | Decision journal, doubt ledger, Brier score. `/es-decision`, `/es-iwrong`, `/es-calibrate`.                                                                                  |
| **Three-faces primitives**   | State, snapshot, gap-driven practice, blend. `/es-state`, `/es-snapshot`, `/es-reach`, `/es-blend`.                                                                          |

If a command has no obvious effect, it usually means the agent did not know which file to operate on. Pass an explicit path or page name.

## Git as the state machine

This is the design choice that keeps everything else honest.

- **`wiki/` is checked into git.** Every change has an author, timestamp, message, and a diff you can read.
- **The agent does not maintain a separate database.** It reads `git log`, `git blame`, and `git show` to reconstruct history. There is nothing else to be in sync with.
- **`wiki/log.md` is the human narrative.** Git is the mechanical record. They mirror each other; **git wins** if they disagree, and the next `/es-lint` reconciles.
- **Reversal is `git revert`.** Promoted a page too early? Demoted the wrong dependency? Roll it back like any other code change. **History is never rewritten** — no `git reset --hard`, no `git push --force`, no `git rebase`. Failed experiments stay in the log so future sessions don't repeat them.
- **Branches are study lines.** A speculative deep-dive into a contested topic can live on a branch and merge in only after `/es-audit` passes on `main`.
- **`git blame wiki/concept/<page>.md`** tells you which command introduced each line, when, and why — provided you follow the commit convention below.
- **Context recovery is explicit.** When an agent resumes work, it runs `git log --oneline -20`, reads `wiki/log.md`, scans `wiki/index.md`, and only then proceeds. This is documented in [AGENTS.md](AGENTS.md) and [.github/copilot-instructions.md](.github/copilot-instructions.md).

The agent is instructed to:

1. After making file edits, **propose a commit** with a body explaining _why_ — what gate passed, what evidence supported the change, what command produced it.
2. Before answering questions about prior state, **consult `git log`** scoped to the relevant path.
3. Refuse to amend or force-push. History is append-only at the repo level.

You stage and commit. The agent never runs `git commit` for you unless you explicitly ask.

**Squashed commits collapse the audit trail.** The whole design rests on one-command-one-commit. If you batch four commands into a single squashed commit, `git blame` and the conventional-commit type table can no longer tell you which command produced which change — and the gates that read `git log` (buddy diagnosis, audit promotion bodies, snapshot summaries) lose resolution. Commit per logical step, not per session. If you must rebase or squash for a public push, do it on a throwaway branch and keep the granular history on `main`.

## Commit message convention

The convention follows [Conventional Commits](https://www.conventionalcommits.org/) and mirrors `wiki/log.md` line format so the two stay synchronized.

```text
<type>(<scope>): <short summary>

<body — what command was run, what changed, what evidence supports it>
```

- **Type** matches the command group (table below).
- **Scope** is the page name, source key, goal slug, or area touched (`laplace-equation`, `griffiths-em-3.1`, `bib`, `lint`, `bootstrap`).
- **Body** is optional for trivial edits but required for promotions, demotions, contradictions, and reverts.

| Type              | When                                                                  | Example                                                                       |
| ----------------- | --------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `goal`            | After `/es-goal`                                                      | `goal(laplace-bvp): pin Laplace BVP study goal`                               |
| `raw`             | Adding a source under `raw/`                                          | `raw(griffiths-em): add §3.1 chapter text`                                    |
| `ingest`          | After `/es-ingest`                                                    | `ingest(griffiths-em-3.1): laplace-equation, separation-of-variables`         |
| `lint`            | After `/es-lint` produced edits or a report                           | `lint(wiki): 4 stranded pages, 2 missing-bib`                                 |
| `audit`           | Promotion or demotion via `/es-audit`                                 | `audit(laplace-equation): promote to grounded`                                |
| `falsify`         | After `/es-falsify`                                                   | `falsify(laplace-equation): survives empirical, damages provenance`           |
| `contradiction`   | After `/es-contradiction`                                             | `contradiction(em-§3.2): griffiths vs jackson sign convention`                |
| `tribal`          | After `/es-tribal` sweep                                              | `tribal(wiki): 3 single-source claims demoted`                                |
| `practice`        | After `/es-problem`, `/es-solve`, `/es-drill`, `/es-project`          | `practice(laplace): solve rect-box BVP`                                       |
| `worked`          | After `/es-worked`                                                    | `worked(separation-of-variables): rect-box example`                           |
| `transfer`        | After `/es-transfer`                                                  | `transfer(eigenvalues): pagerank stationary distribution`                     |
| `verify`          | After `/es-verify` runs a Lean / TLA+ / Python / SymPy / manual check | `verify(cauchy-schwarz): lean pass`                                           |
| `decision`        | After `/es-decision`                                                  | `decision(text-choice): switch primary text from Griffiths to Jackson for §3` |
| `iwrong`          | After `/es-iwrong`                                                    | `iwrong(laplace): uniqueness without boundary regularity`                     |
| `calibrate`       | After `/es-calibrate`                                                 | `calibrate(q4-2026): Brier 0.18 over 24 resolved entries`                     |
| `cite`            | Bibliography changes                                                  | `cite(griffiths2017): add CSL-JSON entry`                                     |
| `lineage`         | After `/es-lineage`                                                   | `lineage(jackson): teachers, mistaken associations`                           |
| `marginalia`      | After `/es-marginalia`                                                | `marginalia(griffiths-em): chapter 3 hot spots`                               |
| `graph` / `stats` | When reports land in `wiki/reports/`                                  | `stats(weekly): 12 grounded pages thin on provenance`                         |
| `style`           | Edits to `notes/style.md`                                             | `style(voice): tighten hedging policy`                                        |
| `chore`           | Repo housekeeping, gitignore, manifest                                | `chore(bootstrap): initialize research-atlas vault`                           |
| `doc`             | Edits to `docs/` and README                                           | `doc(field-layers): clarify proof template`                                   |
| `revert`          | Undoing a previous commit                                             | `revert: revert "audit(laplace-equation): promote to grounded"`               |

Body example for a non-trivial edit:

```text
audit(laplace-equation): promote to grounded

- /es-falsify: survives all four attacks (see wiki/reports/laplace-equation-falsify.md)
- /es-audit: provenance density 0.83
- counterargument section now links contradiction #3

wiki/log.md updated with mirror entry.
```

If the body explains _why_, future-you reads `git log -p wiki/concept/laplace-equation.md` and gets a real audit trail.

## Optional: open as an Obsidian vault

The repo is Obsidian-compatible without conversion:

- `[[wikilinks]]` between pages.
- YAML frontmatter is queryable with the Dataview plugin.
- `^[raw/...]` markers render as block references.
- Graph view shows the full link structure.
- Web Clipper drops new sources directly into `raw/`.

Recommended Obsidian plugins, none of which the system depends on:

- **Dataview** — query frontmatter (`provenance-score`, `status`, `tier`).
- **Spaced Repetition** — handles flashcards and recall scheduling. The Educational Study GHCP Harness deliberately does not implement spaced recall internally.
- **Templater** — drop-in support for the templates under `templates/`.

## Folder map

```text
.github/
  copilot-instructions.md        Repo-wide rules the agent loads automatically.
  prompts/                       ~70 *.prompt.md files; one per slash command.
docs/
  research-atlas-philosophy.md   Why this exists.
  source-discipline.md           Source tiers (Tier 0–5) and citation rules.
  reasoning-primitives.md        Cross-domain reasoning moves.
  flows.md                       Survey → Ground → Core → Practice → Audit → Advance.
  command-catalog.md             Full command table.
  product-notes.md               Productization notes.
  wiki-integration.md            Wiki substrate spec.
  scholarly-extensions.md        Bibliography, adversarial, pedagogy, reflection layers.
  academic-apis.md               Mandatory API search order before generic web search.
  field-layers.md                Math, law, empirical, humanities scaffolding.
templates/
  domain-atlas.md, claim-ledger.md, problem-lab.md,
  source-critique.md, session-brief.md, source-pack.md,
  wiki-page.md, citation.md, contradiction.md,
  decision-journal.md, worked-example.md, proof.md,
  case-brief.md, experiment.md, source-position.md,
  lineage.md, marginalia.md
raw/                             Sources you put here. Agent never edits.
wiki/                            Agent-maintained pages.
  index.md                       Catalog. Updated on every /es-ingest.
  log.md                         Append-only narrative timeline. Mirrors git log.
  bib/                           Bibliography entries (one per cite key).
  contradictions.md              Append-only contradictions register.
  reports/                       /es-lint, /es-audit, /es-falsify, /es-stats outputs.
  steelman/                      Steelman drafts (private to the wiki).
notes/                           Goals, decision journal, style schema, doubts.
maps/, papers/, problems/        Per-topic / per-paper / per-problem working files.
examples/                        Walkthroughs.
AGENTS.md                        The contract the agent operates under.
manifest.json                    Machine-readable index of commands, docs, templates.
```

## Out of scope (on purpose)

The following were explicitly considered and excluded so the system stays usable from a clone-and-go state:

- **Spaced recall.** Use the Obsidian Spaced Repetition plugin or Anki externally. The vault is the deck.
- **Embedding / vector index.** No pgvector, no FAISS. Navigation is by `[[wikilinks]]` and `depends-on:` frontmatter — readable, editable, auditable.
- **PDF / OCR runtime.** A `.prompt.md` cannot run binaries. Convert PDFs to markdown yourself (Marker, Nougat, Mathpix) and drop the markdown into `raw/`.
- **Multi-agent debate runtime.** Replaced by `/es-falsify` + `/es-steelman` + `/es-contradiction` artifacts, which the user reads and judges.
- **Bayesian curriculum routing.** Mastery models require state and reliable signal extraction. The user picks the next command; `/es-stats` and `/es-next` give honest hints.
- **Sigma-Guard / blocking validators.** Lint reports, never blocks. The user is the guard.

If you later want any of these, build them in a separate runtime repo that _consumes_ the markdown vault read-only. Do not bolt them onto this one.

## Troubleshooting

**`/es-*` commands do not appear in Copilot Chat.**
Confirm the workspace is open at the repo root, not a parent. Confirm the Copilot Chat extension version supports `.prompt.md` workspace prompts. Reload the window.

**The agent keeps wholesale-rewriting a `grounded` page.**
Tell it to re-read `AGENTS.md` and the page's frontmatter. The patch-never-regenerate rule is enforced by instruction, not by code; if the agent ignores it, point at the rule explicitly.

**The agent invents a citation.**
This should be rare — the prompts forbid it. When it happens, run `/es-tribal --page <page>` and `/es-falsify <page>`. If the citation is fake, demote the page to `status: stale`, commit `tribal(<page>): fabricated citation removed`, and add a `notes/i-could-be-wrong.md` entry.

**`wiki/log.md` and `git log` disagree.**
Git wins. Patch `wiki/log.md` to match. Commit `chore(reconcile): align wiki/log.md with git history`.

**I want a fresh start on a topic without losing my work.**
Branch: `git checkout -b explore/<topic>`. Keep `main` clean.

**The agent answers without consulting `wiki/index.md` or `git log`.**
This is the most common failure. Open `wiki/index.md` in a tab and reference it explicitly in your prompt: "Consult `wiki/index.md` and recent `git log` first."

## Further reading

- [AGENTS.md](AGENTS.md) — the contract.
- [.github/copilot-instructions.md](.github/copilot-instructions.md) — auto-loaded rules including the commit / state-management discipline.
- [docs/research-atlas-philosophy.md](docs/research-atlas-philosophy.md) — long-form rationale.
- [docs/source-discipline.md](docs/source-discipline.md) — what counts as evidence.
- [docs/wiki-integration.md](docs/wiki-integration.md) — the wiki substrate spec.
- [docs/scholarly-extensions.md](docs/scholarly-extensions.md) — bibliography, adversarial, pedagogy, reflection layers.
- [docs/field-layers.md](docs/field-layers.md) — math, law, empirical, humanities specifics.
- [docs/academic-apis.md](docs/academic-apis.md) — Semantic Scholar / arXiv / OpenAlex / PubMed / Crossref / CourtListener search discipline.
- [docs/command-catalog.md](docs/command-catalog.md) — every command, indexed.

## Rule of use

The highest-level mantra, taken verbatim from [`docs/research-atlas-philosophy.md`](docs/research-atlas-philosophy.md):

> Do not merely make me feel oriented. Make me demonstrate orientation.

The system is only useful if you make it force you to:

1. name the core objects,
2. state the central questions,
3. identify the evidence,
4. reconstruct the reasoning,
5. solve or analyze representative problems,
6. transfer the idea to a new case,
7. name what you still do not know.

If a session does not produce at least one of these, the session was decoration — _learning-shaped entertainment_. Run `/es-stats` and recover.

## License

[MIT](LICENSE).
