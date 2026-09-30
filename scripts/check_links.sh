#!/usr/bin/env bash
# Fails when a built page links to a local path that does not exist in the output,
# or, given a base path as second argument, to a local path outside that base path.
set -euo pipefail
root="${1:-public}"
base="${2:-}"
refs=$(grep -rhoE '(href|src)="?/[^" >]*' "$root" --include='*.html' | sed -E 's/^(href|src)="?//' | sort -u)
if [ -z "$refs" ]; then
  echo "no local links found in $root; the pattern no longer matches the output"
  exit 1
fi
status=0
while IFS= read -r ref; do
  path="${ref%%#*}"
  [ -z "$path" ] && continue
  if [ -n "$base" ] && [ "${path#/"$base"/}" = "$path" ]; then
    echo "link outside /$base/: $ref"
    status=1
    continue
  fi
  if [ ! -e "$root$path" ] && [ ! -e "$root$path/index.html" ]; then
    echo "broken link: $ref"
    status=1
  fi
done <<< "$refs"
echo "checked $(wc -l <<< "$refs" | tr -d ' ') local links"
exit $status
