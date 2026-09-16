---
title: Machine access
key: C
role: Developer
description: Create an access token and create or validate a dataset through the REST API or the MCP server.
weight: 30
---

## Goal

Show that the web interface, the REST API and the MCP server all operate on the same profile and the same validation.

## Steps

1. Create a personal access token under **Access tokens**.
2. Either list profiles and create a dataset through the REST API with `curl`,
3. or connect an MCP client (for example Claude Desktop) to the hub and have the agent extract entities from a short methods paragraph (handout).
4. Validate the result and open it in the web interface.
5. Compare: what did the agent record that is not in the source text? Profiles instruct agents to leave unknown fields empty.

## Discussion prompt

Which of your existing pipelines could push metadata here instead of writing spreadsheets?
