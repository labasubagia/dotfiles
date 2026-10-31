---
name: graphify
description: Use to turn any folder of files (code, docs, papers, images) into a navigable knowledge graph — run graphify on a path, query the graph, fetch a URL into the corpus, or find/explain graph nodes
---

# graphify

`graphify` (PyPI: `graphifyy`) is installed as a `uv` tool. It reads a folder,
builds a knowledge graph (community detection, audit-trail edges), and writes
`graphify-out/`: `graph.html` (interactive), `graph.json` (persistent,
queryable), `GRAPH_REPORT.md` (god nodes + surprising connections).

## Running the pipeline

```bash
graphify .                          # current directory
graphify <path>                     # specific folder
graphify <path> --mode deep         # aggressive INFERRED edges
graphify <path> --update            # re-extract only changed files, merge
graphify <path> --wiki              # agent-crawlable wiki (index.md + articles)
graphify <path> --svg               # export graph.svg
graphify <path> --mcp               # start MCP stdio server
graphify hook install               # git post-commit hook, rebuild graph per commit
```

Second run on a corpus is cheap: SHA256 cache skips unchanged files. `--update`
rebuilds code via AST only (no LLM); doc/image changes need `--update` for the
LLM re-pass.

## Adding to the corpus

```bash
graphify add <url>                         # fetch, save to raw/, update graph
graphify add <url> --author "Name" --contributor "Name"
graphify clone <github-url>                # clone repo, print path for graphify
```

## Querying

```bash
graphify query "<question>"                # BFS traversal over graph.json
graphify path "A" "B"                      # shortest path between two nodes
graphify explain "X"                       # plain-language node explanation
```

`query`/`path`/`explain` read `graphify-out/graph.json` (persistent across
sessions — graph survives without the original files).

## Notes

- **Always announce graphify usage.** Whenever you run graphify (build, query,
  path, explain, add), state it explicitly in your reply and quote the command
  you ran, e.g. `via graphify: graphify query "what connects X to Y?"`. If you
  answer without graphify, say so (`without graphify: read source directly`).
  This makes graphify usage visible in the TUI.
- Every edge is tagged `EXTRACTED` / `INFERRED` / `AMBIGUOUS` — report which
  when you use a connection.
- `graphify --help` lists all commands; `graphify uninstall` removes it from
  detected platforms.
