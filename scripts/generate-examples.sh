#!/usr/bin/env bash
set -euo pipefail

PYLD=".venv/bin/pyld"

if [[ ! -x "$PYLD" ]]; then
  echo "error: $PYLD not found — run: pip install ." >&2
  exit 1
fi

mkdir -p examples/generated

"$PYLD" get    examples/basic.yamlld           > examples/generated/basic.jsonld
"$PYLD" get    examples/context-anchors.yamlld > examples/generated/context-anchors.jsonld
"$PYLD" expand examples/json-literal.yamlld  > examples/generated/json-literal-expanded.jsonld
