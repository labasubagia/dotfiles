#!/usr/bin/env bash
# (Re)stow all dotfile packages into $HOME.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ALL_PACKAGES=(zsh helix npm herdr omp 9router headroom)
PACKAGES=("${ALL_PACKAGES[@]}")
ADOPT=false
DRY_RUN=false

usage() {
  echo "usage: $0 [--adopt] [--dry-run] [--only <pkg>[,<pkg>...]]" >&2
  exit 2
}

command -v stow >/dev/null || {
  echo "error: stow not installed" >&2
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
  --adopt)
    ADOPT=true
    shift
    ;;
  --dry-run)
    DRY_RUN=true
    shift
    ;;
  --only)
    shift
    [[ $# -gt 0 ]] || usage
    IFS=',' read -ra PACKAGES <<<"$1"
    for p in "${PACKAGES[@]}"; do
      case " ${ALL_PACKAGES[*]} " in
      *" $p "*) ;;
      *)
        echo "error: unknown package: $p" >&2
        exit 1
        ;;
      esac
    done
    shift
    ;;
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

if [[ "$ADOPT" == true ]]; then
  stow --no-folding -t "$HOME" --adopt "${PACKAGES[@]}"
  echo "--- review adopted changes ---"
  git status --short
elif [[ "$DRY_RUN" == true ]]; then
  stow --no-folding -t "$HOME" -n -v "${PACKAGES[@]}"
else
  stow --no-folding -t "$HOME" -R "${PACKAGES[@]}"
fi

echo "OK: ${PACKAGES[*]} -> $HOME"
