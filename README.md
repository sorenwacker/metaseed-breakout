# Metaseed Hub breakout

Session plan for a 50-minute breakout on metaseed-hub at "FAIR in action: building a sustainable cycle in LSH", as a Hugo site. No theme dependency; layouts live in `layouts/`.

## Use

```bash
make dev     # hugo server with live reload at http://localhost:1313
make build   # static output in public/
make check   # build with warnings as errors, then fail on broken local links
```

## Where to edit

- `data/agenda.yaml` - time slots; drives the timeline and the agenda page.
- `data/cycle.yaml` - the six cycle steps; drives the cycle diagram.
- `content/` - abstract, cycle text, tracks, discussion questions, preparation checklist.
- `hugo.toml` - event name, duration, hub and documentation links, menu.

Requires Hugo extended 0.146 or later.
