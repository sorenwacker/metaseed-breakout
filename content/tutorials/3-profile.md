---
title: Turn a checklist into a profile
key: 3
role: Data steward
description: Model a lab checklist as a profile, publish it, and see the version bump gate refuse a breaking change.
weight: 30
---

## Goal

## You need

- A hub account.
- Checklist handout (to be provided).

## Steps

1. Create a specification in the spec builder.
2. Add entities, fields, a required field and a pattern rule; nest children under the root.
3. Validate and publish as 1.0.
4. Create a small dataset with it.
5. Make an optional field required and publish as 1.1; read the refusal.
6. Publish as 2.0; check the dataset still refers to 1.0.

## Check

