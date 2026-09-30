#!/usr/bin/env bash
# Fails when a built page lacks the theme switch, the script that drives it, or the stylesheet rules it sets.
set -euo pipefail
root="${1:-public}"
pages=$(find "$root" -name '*.html')
if [ -z "$pages" ]; then
  echo "no pages found in $root"
  exit 1
fi
status=0
while IFS= read -r page; do
  if ! grep -qE '<button[^>]*class="?theme-toggle' "$page"; then
    echo "no theme switch: $page"
    status=1
  fi
  if ! grep -q 'localStorage' "$page"; then
    echo "no theme script: $page"
    status=1
  fi
done <<< "$pages"
for theme in light dark; do
  if ! grep -rqE "data-theme=\"?$theme" "$root" --include='*.css'; then
    echo "stylesheet has no rule for data-theme=$theme"
    status=1
  fi
done
echo "checked theme switch on $(wc -l <<< "$pages" | tr -d ' ') pages"
exit $status
