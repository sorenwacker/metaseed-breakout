---
title: Extend a repository standard
key: B
role: Data steward
description: A sequencing experiment goes to ENA, but the group records more than ENA asks for. Clone the ENA profile and add the extra variables with constraints.
weight: 20
---

## Scenario

Your group runs a genomics sequencing experiment and will submit it to ENA. ENA's metadata model covers what the archive needs, but the group also tracks information ENA does not ask for, for example the sequencing facility's internal run identifier, the RNA integrity number of each sample, or the storage freezer position. Instead of keeping those in a separate spreadsheet, extend the ENA profile.

## Goal

See a repository standard as a versioned artefact you can build on, with your additions validated like the original fields.

## Steps

1. Open the **Builder**, choose **+ New Specification**, then **From Template**, and pick ENA.
2. Pick the entity each extra variable belongs to (for example Sample or Run).
3. Add three or four fields and give each a constraint: a required flag, a pattern (such as `^RUN-[0-9]{4}$` for an internal identifier), a minimum and maximum (RNA integrity number between 1 and 10), or a list of allowed values.
4. Run the checks and publish the specification as version 1.0.
5. Create a small dataset with it and enter one value that breaks each constraint. Read what validation reports.

## Discussion prompt

Which of the added variables would other groups in your community also need, and who would decide whether they belong in a shared profile?
