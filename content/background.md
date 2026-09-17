---
title: Background
eyebrow: From the fellowship talk
description: Why the project started, what a profile is, and which interfaces read it. Outline taken from the TDCC-LSH FAIR Fellowship presentation.
card: true
weight: 5
---

## The fellowship

- TDCC-LSH FAIR Fellowship, one year, one day per week.
- Goals: combine ISA and MIAPPE; let people and AI agents work with the same metadata.

## Why metadata standards

- Findability and reuse (FAIR), reproducibility, repository submission.
- ISA (Investigation-Study-Assay) for life science experiments; MIAPPE (Minimum Information About Plant Phenotyping Experiments) for plant phenotyping.
- The starting assumption: "MIAPPE is a profile of ISA".
- The obstacle: no common language to describe and compare metadata models.

## A standard as a profile

- Entity types, fields and validation rules written as YAML.
- YAML profile, generated Pydantic models, validation, serialisation.
- Entities form a tree: nesting for parent-child, string references for cross-links.

## Interfaces

- Web UI (spec builder, explorer, entity editor, graph view), REST API, MCP server, Python library.
- All four use the same profile and the same validation.

{{< shot src="images/explorer-comparison.jpg" alt="ISA and MIAPPE side by side in the explorer" caption="The explorer compares two profiles entity by entity." >}}

{{< shot src="images/graph-view.jpg" alt="Graph view of a dataset" caption="The graph view shows a dataset's entities and their links." >}}

## Current limits

- Profiles are trees; general graph relations are expressed as references.
- No binary or union field types; no custom code in validation rules.
