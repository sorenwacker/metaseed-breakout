---
title: Machine access
key: C
role: Developer
description: Create an access token, create a dataset through the REST API or the MCP server, and validate it.
weight: 30
---

## Goal

Show that the web interface, the REST API and the MCP server all operate on the same profiles and the same datasets, and that a dataset is validated the same way however it was created.

## Steps

1. Create a personal access token under **Access tokens** on your profile page.
2. Either create a MIAPPE 1.2 dataset through the REST API with `curl` and read it back,
3. or connect an MCP client (for example Claude Code) to the hub and have the agent extract entities from a short methods paragraph (handout).
4. Validate the result and open it in the web interface.
5. Compare: what did the agent record that is not in the source text? The hub's MCP server instructs agents to leave unknown fields empty.

## Discussion prompt

Which of your existing pipelines could push metadata here instead of writing spreadsheets?
