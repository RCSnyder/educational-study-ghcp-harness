# Empirical Study Page

For papers reporting experiments, observational studies, or simulations. One page per study (not per claim — a study can support many claims).

## Frontmatter

```yaml
---
type: source
study-type: experiment # experiment | observational | meta-analysis | simulation | RCT | case-study
tier: 1
status: draft
confidence: medium
preregistered: false
registry: "" # OSF / clinicaltrials.gov / AEA RCT registry / ...
n: 120
effect-size:
  metric: cohen-d
  value: 0.42
  ci-low: 0.18
  ci-high: 0.66
p-value: 0.003
replication-status: unattempted # original | replicated-direct | replicated-conceptual | failed-replication | mixed | retracted | unattempted
retracted: false
conflicts-of-interest: ""
funding: ""
data-available: true
data-url: ""
suggested-by: ...
tags:
  - domain/...
---
```

## Body

```markdown
# <Study title>

## Question

The single empirical question the study tries to answer.

## Population / sample

Who, how recruited, how many, exclusions.

## Design

How the question is operationalized. Independent variables, dependent variables, controls, blinding, randomization, allocation.

## Pre-registration

- Pre-registered: yes/no
- If yes: deviations from pre-registration: ...
- If no: which analyses look exploratory and which look confirmatory.

## Measures

Concretely how each variable is measured. Validation history of each measure.

## Analysis

Statistical methods used. Were they appropriate to the design?

## Results

The numbers. Effect size, CI, sample, p-value. Verbatim from the paper where possible.

## Authors' interpretation

<paraphrased>

## Your reading

Separate from the authors'. Things to flag:

- Multiple comparisons correction
- Garden of forking paths
- Generalizability beyond sample
- Effect-size meaningfulness vs statistical significance
- Robustness to alternative specifications

## Replication trail

- Direct replications: [[...]]
- Conceptual replications: [[...]]
- Failed replications: [[...]]
- Meta-analyses including this study: [[...]]

## What would refute the headline claim

- A direct replication with n>X failing to find effect.
- An identified confound: ...
- A measurement validity failure: ...

## Pages relying on this study

_(filled by `/es-lint --backlinks`)_
```

## Rules

1. **`replication-status: failed-replication` or `retracted: true` cascades.** All pages with `relies-on: <this>` are demoted to `status: stale` and surfaced in the next `/es-lint`.
2. **Effect size, CI, and n are required for a `grounded` empirical page.** No exceptions. "Statistically significant" without effect size is folklore.
3. **Pre-registration status is required.** Unregistered studies are not invalid, but they live with `confidence: medium` at best until replicated.
4. **Funding and conflicts of interest are recorded, not editorialized.** Let the reader weigh them.
