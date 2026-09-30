# Metaseed Hub breakout

Session plan for a 50-minute breakout on Metaseed Hub at "FAIR in Action: Building a Sustainable FAIR Future in Life Science and Health", as a Hugo site. No theme dependency; layouts live in `layouts/`.

## Use

```bash
make dev     # hugo server with live reload at http://localhost:1313
make build   # static output in public/, with pages of removed content deleted
make check   # build into .check/ with warnings as errors, then fail on broken or unprefixed local links, a missing theme switch or an incomplete slide view
```

## Deploy

Pushing a semver tag (`vX.Y.Z`) runs `make check`, builds the site and publishes it to GitHub Pages. Pushing a branch does not deploy. `make check` builds under a path prefix, as Pages serves the site, so a link that ignores the base URL fails the check.

## Slides

A page with `outputs: [html, slides]` in its front matter is also published as `slides.html` next to it, and its header links to that view. The slide view is generated from the same content: the page title and introduction form the first slide, and every second-level heading starts a new one. Arrow keys, space and Page Up/Down move between slides. The presentation page uses this.

## Colour scheme

The site follows the operating system's light or dark setting. The switch in the header overrides it and the choice is stored in the browser. Colours are CSS variables in `assets/css/main.css`; diagrams are inline SVG styled with the same variables, so they follow the scheme. Screenshots are fixed images and do not.

## Where to edit

- `data/agenda.yaml` - time slots; drives the timeline and the agenda page.
- `data/cycle.yaml` - the six cycle steps; drives the cycle diagram and step list in the presentation.
- `content/` - abstract, presentation, tracks, discussion questions, preparation checklist.
- `assets/images/` - screenshots, placed in a page with `{{< shot src="images/..." alt="..." caption="..." >}}`. The published file name carries a content hash, so a replaced screenshot is not served from a browser cache.
- `assets/diagrams/` - SVG diagrams, placed in a page with `{{< diagram name="..." caption="..." >}}`.
- `hugo.toml` - event name, duration, hub and documentation links, menu.

Requires Hugo extended 0.146 or later.
