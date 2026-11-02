#!/usr/bin/env bash
# Lists unfilled placeholders. Run before every release; it exits non-zero if any remain.
cd "$(dirname "$0")" || exit 1
hits=$(grep -rnE "TO COMPLETE|INSERT REF|ADD LINK|\[DATE\]|\"DATE\"|\{\.mark\}" \
  --include='*.qmd' --include='_variables.yml' --include='*.yml' . \
  | grep -v '^./docs/' | grep -v '^./check-placeholders.sh')
if [ -n "$hits" ]; then
  echo "$hits"
  echo; echo "Unfilled placeholders found."
  exit 1
fi
echo "No placeholders left."