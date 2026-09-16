---
title: Specify and revise
key: B
role: Data steward
description: Turn a lab checklist into a profile, publish it, then make a breaking change and see the version gate block it.
weight: 20
---

## Goal

See a standard as a versioned artefact that tools read, rather than a document people interpret.

## Steps

1. Open the spec builder and start from scratch, or clone the ISA profile.
2. Model the handout checklist: two entities (for example Sample and Measurement), five to eight fields, one required field and one pattern rule.
3. Link Measurement under Sample so it is reachable from the root.
4. Validate and publish as version 1.0. Create a small dataset with it.
5. Make the new field required and try to publish without a major version bump. The gate refuses.
6. Publish correctly and check that the existing dataset is still bound to 1.0.

## Discussion prompt

In your community, who would decide that this change needs a new major version?
