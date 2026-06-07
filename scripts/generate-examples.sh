#!/usr/bin/env bash
set -euo pipefail

PYLD=".venv/bin/pyld"

if [[ ! -x "$PYLD" ]]; then
  echo "error: $PYLD not found — run: pip install ." >&2
  exit 1
fi

mkdir -p examples/generated

"$PYLD" get    examples/anchors.yamlld       > examples/generated/anchors.jsonld
"$PYLD" expand examples/json-literal.yamlld  > examples/generated/json-literal-expanded.jsonld
