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
"$PYLD" expand examples/json-literal.yamlld    > examples/generated/json-literal-expanded.jsonld

IOLANTA=".venv/bin/iolanta"
mkdir -p examples/mermaid

PYTHONHASHSEED=0 "$IOLANTA" examples/intro.yamlld           --as mermaid 2>/dev/null > examples/mermaid/intro.mmd
PYTHONHASHSEED=0 "$IOLANTA" examples/basic.yamlld           --as mermaid 2>/dev/null > examples/mermaid/basic.mmd
PYTHONHASHSEED=0 "$IOLANTA" examples/context-anchors.yamlld --as mermaid 2>/dev/null > examples/mermaid/context-anchors.mmd
PYTHONHASHSEED=0 "$IOLANTA" examples/stream.yamlld          --as mermaid 2>/dev/null > examples/mermaid/stream.mmd
PYTHONHASHSEED=0 "$IOLANTA" examples/json-literal.yamlld    --as mermaid 2>/dev/null > examples/mermaid/json-literal.mmd
PYTHONHASHSEED=0 "$IOLANTA" examples/html-embed.html        --as mermaid 2>/dev/null > examples/mermaid/html-embed.mmd
