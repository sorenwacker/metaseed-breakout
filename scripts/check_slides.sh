#!/usr/bin/env bash
# Fails when a slide view does not have a title slide plus one slide per section of the page it is generated from.
set -euo pipefail
root="${1:-public}"
decks=$(find "$root" -name 'slides.html')
if [ -z "$decks" ]; then
  echo "no slide view found in $root"
  exit 1
fi
status=0
while IFS= read -r deck; do
  page="$(dirname "$deck")/index.html"
  sections=$(grep -o '<h2' "$page" | wc -l | tr -d ' ')
  slides=$(grep -oE '<section class="?slide' "$deck" | wc -l | tr -d ' ')
  if [ "$slides" -ne $((sections + 1)) ]; then
    echo "$deck has $slides slides; $page has $sections sections and needs $((sections + 1))"
    status=1
  fi
  if ! grep -qE 'href="?[^" >]*slides\.html' "$page"; then
    echo "$page does not link to its slide view"
    status=1
  fi
done <<< "$decks"
echo "checked $(wc -l <<< "$decks" | tr -d ' ') slide views"
exit $status
