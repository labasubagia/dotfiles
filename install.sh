#!/usr/bin/env bash
# (Re)stow all dotfile packages into $HOME.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PACKAGES=(zsh helix npm herdr omp 9router headroom)

usage() {
  echo "usage: $0 [--adopt | --dry-run]" >&2
  exit 2
}

command -v stow >/dev/null || {
  echo "error: stow not installed" >&2
  exit 1
}

for arg in "$@"; do
  case "$arg" in
  --adopt | --dry-run) ;;
  *) usage ;;
  esac
done

cd "$DOTFILES"

for pkg in "${PACKAGES[@]}"; do
  [[ -d "$pkg" ]] || {
    echo "error: missing package dir: $pkg" >&2
    exit 1
  }
done

if [[ " $* " == *" --adopt "* ]]; then
  stow --no-folding -t "$HOME" --adopt "${PACKAGES[@]}"
  echo "--- review adopted changes ---"
  git status --short
elif [[ " $* " == *" --dry-run "* ]]; then
  stow --no-folding -t "$HOME" -n -v "${PACKAGES[@]}"
else
  stow --no-folding -t "$HOME" -R "${PACKAGES[@]}"
fi

echo "OK: ${PACKAGES[*]} -> $HOME"
