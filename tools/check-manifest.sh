#!/usr/bin/env bash
# tools/check-manifest.sh
#
# Drift check: verify that manifest.json's canonical_commands and
# product_aliases lists agree with the actual files under .github/prompts/.
#
# Exits non-zero if any drift is found. Intended to be run pre-commit
# or in CI. No arguments.
#
# Usage:
#   bash tools/check-manifest.sh

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$REPO_ROOT"

MANIFEST="manifest.json"
PROMPTS_DIR=".github/prompts"

if [[ ! -f "$MANIFEST" ]]; then
  echo "ERROR: $MANIFEST not found at repo root" >&2
  exit 2
fi
if [[ ! -d "$PROMPTS_DIR" ]]; then
  echo "ERROR: $PROMPTS_DIR not found" >&2
  exit 2
fi

# Helper: extract a JSON string-array field from manifest.json. Tolerates
# trailing commas and whitespace. Requires `jq` if available; falls back
# to a grep/sed pipeline.
extract_field() {
  local field="$1"
  if command -v jq >/dev/null 2>&1; then
    jq -r ".${field}[]" "$MANIFEST"
  else
    # crude fallback: print lines between "<field>": [ and the next ]
    awk -v f="\"${field}\"" '
      $0 ~ f"[[:space:]]*:[[:space:]]*\\[" { in_arr = 1; next }
      in_arr && /^[[:space:]]*\]/ { in_arr = 0 }
      in_arr {
        gsub(/^[[:space:]]*"/, "")
        gsub(/",?[[:space:]]*$/, "")
        if (length($0)) print
      }
    ' "$MANIFEST"
  fi
}

# Files actually present
present_canonical=$(ls "$PROMPTS_DIR"/*.prompt.md 2>/dev/null \
  | xargs -n1 basename \
  | sed 's/\.prompt\.md$//' \
  | grep -v '^ra-' \
  | sort -u)

present_aliases=$(ls "$PROMPTS_DIR"/es-*.prompt.md 2>/dev/null \
  | xargs -n1 basename \
  | sed 's/\.prompt\.md$//' \
  | sort -u)

# Manifest-declared
declared_canonical=$(extract_field "canonical_commands" | sort -u)
declared_aliases=$(extract_field "product_aliases" | sort -u)

drift=0

report_diff() {
  local label="$1" present="$2" declared="$3"
  local only_present only_declared
  only_present=$(comm -23 <(echo "$present") <(echo "$declared"))
  only_declared=$(comm -13 <(echo "$present") <(echo "$declared"))
  if [[ -n "$only_present" ]]; then
    drift=1
    echo "DRIFT [$label] in $PROMPTS_DIR but not manifest:"
    echo "$only_present" | sed 's/^/  /'
  fi
  if [[ -n "$only_declared" ]]; then
    drift=1
    echo "DRIFT [$label] in manifest but no file:"
    echo "$only_declared" | sed 's/^/  /'
  fi
}

report_diff "canonical_commands" "$present_canonical" "$declared_canonical"
report_diff "product_aliases" "$present_aliases" "$declared_aliases"

# Cross-check: every canonical should have a ra- alias and vice versa.
canonical_from_aliases=$(echo "$present_aliases" | sed 's/^ra-//' | sort -u)
missing_alias=$(comm -23 <(echo "$present_canonical") <(echo "$canonical_from_aliases"))
missing_canonical=$(comm -13 <(echo "$present_canonical") <(echo "$canonical_from_aliases"))
if [[ -n "$missing_alias" ]]; then
  drift=1
  echo "DRIFT [pairing] canonical without ra- alias:"
  echo "$missing_alias" | sed 's/^/  /'
fi
if [[ -n "$missing_canonical" ]]; then
  drift=1
  echo "DRIFT [pairing] ra- alias without canonical:"
  echo "$missing_canonical" | sed 's/^/  /'
fi

if [[ "$drift" -eq 0 ]]; then
  canonical_count=$(echo "$present_canonical" | wc -l | tr -d ' ')
  alias_count=$(echo "$present_aliases" | wc -l | tr -d ' ')
  echo "OK: $canonical_count canonical commands, $alias_count ra- aliases, manifest agrees, all paired."
  exit 0
else
  echo
  echo "FAIL: manifest drift detected. Update manifest.json or rename files." >&2
  exit 1
fi
