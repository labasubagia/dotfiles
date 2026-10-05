#!/usr/bin/env bash
# (Re)stow all dotfile packages into $HOME.
set -euo pipefail
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PACKAGES=(zsh helix npm herdr omp 9router)
cd "$DOTFILES"
if [[ "${1:-}" == "--adopt" ]]; then
  stow --no-folding -t "$HOME" --adopt "${PACKAGES[@]}"
  echo "--- review adopted changes ---"
  git status --short
else
  stow --no-folding -t "$HOME" -R "${PACKAGES[@]}"
fi
echo "OK: ${PACKAGES[*]} -> $HOME"
