# AGENTS.md

Guidance for AI agents (and humans) working in this repository. Read this before making changes.

## Overview

This repo is a set of dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a package that mirrors a part of your home directory; `install.sh` symlinks everything into place. This repo is the source of truth for configuration — not for secrets, machine state, or large binaries, which are intentionally kept out.

The general shape of any task: understand how the repo is structured, make the smallest change that fits existing patterns, keep the docs in sync, and let the automatic checks confirm nothing is broken.

## Repo layout

Each package folder maps to a path in `$HOME`. A quick orientation:

- `install.sh` — applies (or removes) the symlinks for all packages.
- `README.md` — the friendly overview: what each package does, required dependencies, setup steps.
- `AGENTS.md` — this file.
- `zsh/`, `helix/`, `npm/`, `herdr/`, `omp/`, `9router/`, `headroom/`, `lazygit/`, `git/`, `tmux/` — one folder per package, mirroring `$HOME`.
- `.pre-commit-config.yaml` — the checks that run on every commit.

For the exact package list and what each installs, see `README.md`. Don't duplicate that detail here; it lives and is maintained in the README.

## Install

Clone the repo and run `./install.sh`. That's the whole flow for a new machine — it links every package into the home directory. The README covers the variations (`--only` for a subset, `--adopt` to pull live config back into the repo, `--dry-run` to preview) and the per-machine prerequisites.

Rule of thumb: `install.sh` should be the one command that makes a machine match this repo. If a change adds something that a fresh machine wouldn't get, it either needs to be part of a package or documented as a manual step.

## Dependencies

Configuration lives in this repo; the programs that read it do not. Anything that is a binary or a heavy install (for example `delta`, `herdr`, `omp`, `headroom`) is expected to be installed on the machine, not committed here. The README's dependency section is the checklist and points to the official sources.

If a change relies on a new program, call it out — don't assume everyone (or every agent) has it.

## Pre-commit / hooks

Commits run a set of automatic checks (formatting, linting, secret scanning). These exist to keep the repo clean and are not meant to be worked around. If a check fails, fix the underlying issue and re-run; don't skip or bypass the hook.

You can run the same checks locally before committing with `pre-commit run --all-files`.

## Conventions

- **Keep docs in sync.** If a change affects structure, a package, dependencies, or workflows, update `README.md` (and this file when relevant) in the same change. Stale docs are worse than no docs.
- **One package per folder.** Don't merge packages. A new tool gets a new top-level folder that mirrors `$HOME`, and gets registered in `install.sh` and the README.
- **Narrow, minimal changes.** Prefer the fewest files and the smallest diff that does the job. No scaffolding "for later."
- **Match existing patterns.** Follow how the rest of the repo is shaped. Don't introduce a second way of doing what one way already handles.
- **No secrets, no machine state.** Store only configuration. Anything secret lives as a template (for example `env.example`), never as a real value.
- **Theme consistency.** UI configs in this repo use the tokyonight night palette. Match it for new UI work unless there's a stated reason not to.

## Updating this file

Keep this document current and accurate, and follow the same rule it preaches: when the repo or its conventions change, update this file in the same change. Run the Markdown linter when you edit it (`pre-commit run markdownlint --files AGENTS.md`). Don't delete the "keep docs in sync" convention while it's in force.
