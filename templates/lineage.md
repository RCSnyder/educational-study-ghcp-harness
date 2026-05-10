# Intellectual Lineage

A graph orthogonal to the concept graph. Every grounded thinker entity page can carry a lineage block.

## Frontmatter (additions to entity page)

```yaml
---
type: entity
sub-type: thinker # thinker | school | movement | institution
born: 1879
died: 1955
nationality: ...
field: physics
---
```

## Body block (insert into the thinker's wiki page)

```markdown
## Intellectual lineage

### Teachers / formative influences

- [[entity/teacher-1]] — relationship: doctoral advisor / dominant influence / read-deeply
- [[entity/teacher-2]] — relationship: ...

### Students / direct heirs

- [[entity/student-1]] — relationship: doctoral student / collaborator / declared heir

### Read by / drew on

- [[entity/older-thinker-1]] — works actually engaged: [[source/...]]
- [[entity/older-thinker-2]] — relationship: cited but not engaged / engaged but disagreed

### Broke with

- [[entity/predecessor]] — point of break: <one sentence; cite the published break>
- (If "everyone broke with X" is the legend, mark it as such and check primary sources.)

### Mistaken associations

Common attributions or "X-ian" labels that the historical record does not support.

- Often called "Y-ian"; actually disagreed with Y on: ...
- Often paired with [[entity/Z]]; actually had no documented engagement.

### Lineage notes

The single load-bearing observation about how this thinker fits into the field's history. One paragraph.
```

## Rules

1. **Each lineage edge needs a citation.** "X was influenced by Y" without a textual or biographical anchor is folklore. Use `/es-tribal` to find these.
2. **Direction matters.** "Drew on" ≠ "broke with" ≠ "extended." Be specific.
3. **Mistaken associations are first-class.** Most influential thinkers carry decades of bad attribution. Documenting it once is the most useful thing this template does.
4. **Schools and movements get their own pages** (`type: entity, sub-type: school`) with the same lineage structure plus a "canonical texts" section and a "what unifies vs diversifies the school" section.

## Why this exists

In the humanities and history of science, the **intellectual genealogy** is often the most important fact about a thinker — and it is precisely the fact that gets summarized into uselessness in textbook prose. A first-class lineage layer prevents that.
