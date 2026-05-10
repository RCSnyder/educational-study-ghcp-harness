# Style / Voice Schema

How explanations and notes should read in this vault. Keeps successive `/es-explain`, `/es-trail`, `/es-deepdive`, `/es-ingest` outputs consistent in voice instead of drifting into whatever default the model fell into that day.

`/es-style` edits this file. All explainer commands read it first.

---

## Voice

- **Register:** <e.g. graduate-student-talking-to-graduate-student>
- **Person:** <2nd person? 1st-plural? impersonal?>
- **Hedging:** <calibrated; never "many believe"; cite or omit>
- **Density:** <textbook-density vs lecture-density vs notebook-density>

## Diction

- **Jargon:** <introduce on first use with a one-line gloss>
- **Math:** <inline KaTeX freely; display math sparingly>
- **Examples:** <one canonical example before any generalization>
- **Forbidden phrases:** "as we all know", "obviously", "it is widely accepted that" (without a citation)

## Structure

- **Headings:** <H2 for sections, H3 for subsections, no deeper>
- **Length:** <target length per explainer or per ingest summary>
- **Provenance density:** <every non-trivial claim carries a `^[raw/...]` or `[@cite]`>

## Defaults for specific commands

- `/es-explain`: <variant>
- `/es-deepdive`: <variant>
- `/es-ingest` summaries: <variant>
- `/es-trail` first-pass commentary: <variant>

## Override mechanism

A page can override style locally with frontmatter `style-override: <name>`. Named overrides live as named blocks below.

---

## Named overrides

### compact

Short paragraphs. Bullet-heavy. Minimal prose.

### narrative

Long paragraphs. Few bullets. Reads like a chapter.

### proof

LaTeX-heavy. Numbered steps. No prose between steps unless load-bearing.

(Add your own.)
