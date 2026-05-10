# raw/ — Immutable Sources

This directory holds source material the agent reads from but **never modifies**.

What goes here:

- Uploaded textbook scans, lecture notes, problem sets.
- Web clippings (Obsidian Web Clipper recommended; bind to a hotkey).
- Paper PDFs and their extracted markdown.
- Transcripts (lectures, podcasts, interviews).
- Datasets, problem statements, primary documents.

What does **not** go here:

- Anything the agent generates. That belongs in `wiki/`, `notes/`, `maps/`, `papers/`, or `problems/`.

Conventions:

- One subdirectory per source group when sources cluster (e.g. `raw/griffiths-em/`, `raw/historiography/`).
- Filenames are stable identifiers — wiki pages and notes link back to them via `^[raw/<file>:<lines-or-section>]`.
- Images may live in `raw/assets/` (compatible with Obsidian's default attachment folder setting).

To ingest a source into the wiki layer:

```text
/es-ingest raw/<file>
```
