---
name: es-calibrate
description: Brier-score review of resolved decision-journal predictions
argument-hint: "[--since YYYY-MM-DD] [--domain <tag>]"
agent: "agent"
---

## Operating contract

Read [notes/decision-journal.md](../../notes/decision-journal.md). Compute calibration metrics over **resolved** entries only. Honest calibration requires the outcome to be filled in — unresolved entries are skipped.

# EDUCATIONAL STUDY — CALIBRATE

## Step 1 — Collect entries

- Parse decision-journal entries with `Confidence:` and `Outcome:` blocks both filled in.
- Filter by `--since` and/or `--domain` if provided.
- Count: total entries, resolved, by domain.

## Step 2 — Score

For each resolved entry:

- `p` = stated confidence (0..1).
- `o` = outcome (1 if right, 0 if wrong; partial-credit cases mark `0.5` and note explicitly).
- Squared error: $(p - o)^2$.

Aggregate:

- **Brier score** = mean of squared errors.
- **Calibration table** by confidence band (0.5–0.6, 0.6–0.7, 0.7–0.8, 0.8–0.9, 0.9–1.0): predicted rate vs actual rate.
- **Resolution** and **reliability** decomposition if entry count ≥ 20.

## Step 3 — Interpretation

- "Calibrated at 0.7" means: when you said 0.7, you were right 70% of the time.
- Surface the worst-calibrated band — the one with the largest gap between stated and actual.
- Compare to prior calibration runs if any (`wiki/reports/calibration-*.md`).

## Step 4 — Domain breakdown

If `--domain` not given, still compute per-domain Brier scores. Pattern hunt: are you systematically overconfident in a specific subfield?

## Step 5 — Write the report

- `wiki/reports/calibration-<YYYY-MM-DD>.md` with the table, decomposition, and a one-paragraph "what changed since last run."
- Patch [notes/decision-journal.md](../../notes/decision-journal.md) header with the latest Brier score.

## Step 6 — Next action

- Identify the single worst-calibrated band or domain.
- Recommend `/es-iwrong <topic>` to write a doubt entry for that domain.

## Guardrail

Calibration is only meaningful with ≥ 20 resolved predictions. Below that, report the score but flag it as "low-power; do not act on this yet."
