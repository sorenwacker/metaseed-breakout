---
title: "Metaseed: define, compare and use metadata specifications"
linkTitle: Presentation
eyebrow: From the fellowship
description: What metadata and metadata specifications are, why specifications are hard to compare, what metaseed does about it, the six steps the demo follows, and what the fellowship taught.
card: true
weight: 5
outputs: [html, slides]
---

## The fellowship

- TDCC-LSH FAIR Fellowship, one year, one day per week.
- Goals: combine ISA and MIAPPE; let people and AI agents work with the same metadata.
- The starting assumption: "MIAPPE is a profile of ISA".

## What is metadata

- Metadata is data that describes other data: who produced it, from what material, how, when and under which conditions.
- In a plant phenotyping experiment, the plant height measured per plot is the data. The variety, the field location, the sowing date and the measurement method are metadata.

## Why metadata matters

- Without metadata a dataset cannot be interpreted, by other people or by its authors a few years later.
- Each of the FAIR principles (findable, accessible, interoperable, reusable) depends on it.
- Reproducing an experiment requires it, and repositories require it on submission.

## What is a metadata specification

- A metadata specification, often called a standard, states which metadata to record: the entities, their fields, which fields are required and which values are allowed.
- ISA (Investigation-Study-Assay) covers life science experiments.
- MIAPPE (Minimum Information About a Plant Phenotyping Experiment) covers plant phenotyping.
- Repositories such as ENA define their own for submissions.

## Why we use specifications

- Everyone who follows a specification records the same things, so nothing essential is left out.
- Datasets from different groups can be combined and compared.
- Software can check metadata against the specification, and repositories can accept it without manual rework.

## Which standards do you work with?

- Which metadata standards do you use today?
- Which would you like to have available as a profile?
- The answers go on the shared board and come back in the discussion.

## Specifications are hard to compare

- Each specification is published in its own form: MIAPPE as a checklist, ISA as an abstract model with tabular and JSON serialisations, JERM as an ontology.
- There is no common language to express them, so there is no direct way to place two specifications side by side.
- Without one, whether MIAPPE is a profile of ISA is hard to check.

## What metaseed does

- Metaseed expresses every specification in one common format, the profile: entity types, fields and validation rules written as YAML.
- Entities form a tree: nesting for parent-child relations, string references for cross-links.
- Two specifications written as profiles can be compared entity by entity and field by field.

{{< shot src="images/explorer-comparison.jpg" alt="ISA and MIAPPE side by side in the explorer" caption="The explorer compares two profiles entity by entity." >}}

## One profile, several interfaces

- Pydantic models, validation and serialisation are generated from the profile.
- Five interfaces read it: the web UI (spec builder, explorer, entity editor, graph view), the REST API, the MCP server, the command line and the Python library.
- All five use the same profile and the same validation.

{{< shot src="images/graph-view.jpg" alt="Graph view of a dataset" caption="The graph view shows a dataset's entities and their links." >}}

## AI agents and MCP

- The Model Context Protocol (MCP) is an open standard through which an AI agent calls tools that a server offers.
- The metaseed MCP server offers tools to list profiles and read their schema, to create and update entities, and to validate a dataset.
- An agent therefore works with the same profile and the same validation as a person in the web UI. It is instructed to record only what the source states and to leave unknown fields empty.

## From standard to dataset and back

The demo goes through these six steps once, and the no-laptop track maps participants' own workflows onto them.

{{< cycle >}}

## Why the last step matters

- Standards change after datasets have been created with them.
- A tool that embeds its own copy of a standard has to reimplement each change, and existing datasets break or silently diverge.
- In Metaseed Hub the profile is the single source for forms, validation and exports.
- A published version cannot be edited, and a dataset stays bound to the version it was created with.

{{< shot src="images/spec-builder.jpg" alt="Spec builder in Metaseed Hub" caption="The spec builder: where a standard is defined, revised and published." >}}

## Lessons learned

Six findings: three about the standards, two about building tools on them, and one conclusion.

## ISA and MIAPPE model different things

- The starting assumption, "MIAPPE is a profile of ISA", did not hold. This was one of the first findings.
- ISA models the process of an experiment: the steps that lead from material to data.
- MIAPPE models the outcome of an experiment: what was observed, on which units, under which conditions.
- Parts of a process that ISA can model cannot be modelled in MIAPPE, so the two are separate models that need a mapping between them.

{{< diagram name="process-outcome" caption="ISA links materials and data through processes; MIAPPE nests what was observed under a study." >}}

## The same name can denote different entities

- Event in FAIRDOM-SEEK is a meeting, such as a conference.
- Event in MIAPPE is something that happens during a study, such as planting or fertilising a field.
- Matching entities across standards by name gives false correspondences; the comparison has to use the definitions.

## Not every standard is defined as tables

- Some standards list entities and fields as tables. Others, such as JERM, the model behind FAIRDOM-SEEK, are published only as an ontology.
- An ontology does not prescribe a database schema: which classes become tables and which relations become columns or links is left open.
- The conversion is therefore ambiguous, and two implementations of the same standard can differ.

## Specifications range from fixed to absent

- Three points on the spectrum: a fixed specification, a modifiable specification, no specification.
- Tools for a fixed specification are easier to build and perform better.
- Researchers often want to add their own columns and variables, which a fixed specification does not allow.
- A modifiable specification has to be managed within a project. Two options: a base model that allows variation, which is common, or per-dataset specifications that deviate from it.

{{< diagram name="spec-spectrum" caption="Moving away from a fixed specification trades tool simplicity for freedom to extend." >}}

## A tree may not be enough

- In a metaseed profile each entity is nested under one parent, and a link to any other entity is a string reference.
- Not every standard fits a tree. An ISA process is a graph in which a sample can derive from several sources and feed several assays.
- Opening the profile model to arbitrary graphs is under consideration.
- Other current limits: no binary or union field types, and no custom code in validation rules.

{{< diagram name="tree-graph" caption="Part of the MIAPPE profile as a tree with one reference, next to an ISA process in which a sample has two parents." >}}

## A universal specification is unlikely to be usable

- A specification that covers every use case may be possible to build.
- Its complexity would most likely make it unusable for people.
- Usable specifications model one use case for one purpose. The working conclusion is to accept several purpose-specific specifications side by side; it is open for discussion in the session.
