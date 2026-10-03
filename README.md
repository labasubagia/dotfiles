# dotfiles (GNU Stow)

One directory per stow package; layout inside each mirrors `$HOME`.
`./install.sh` symlinks everything into `$HOME`.

| package | provides |
|---|---|
| `zsh` | `~/.zshrc` (oh-my-zsh + autosuggestions/highlighting + fnm) |
| `helix` | `~/.config/helix/{config,languages}.toml` (theme: tokyonight) |
| `npm` | `~/.npmrc` (`allow-scripts=9router`) |
| `herdr` | `~/.config/herdr/config.toml` (theme: tokyo-night) |

## Usage

```sh
./install.sh            # (re)stow all packages into $HOME
stow -t ~ <pkg>         # single package, e.g. stow -t ~ helix
stow -t ~ -D <pkg>      # unstow one package
./install.sh --adopt    # pull live $HOME files back into repo, then review with git diff
```

Fresh machine: `git clone <url> ~/dotfiles && cd ~/dotfiles && ./install.sh`.
Requires `stow` + `oh-my-zsh` (zsh package assumes `$HOME/.oh-my-zsh`).

## Deliberately excluded

- Secrets: `~/.config/9router/env` (dashboard password), `~/.config/opencode/service.json`
- Machine state: herdr logs/socks, go telemetry, ubuntu-insights consent, empty compose dir
- Binaries: `~/.local/bin/{herdr,omp,uv,uvx}` — reinstall per machine, don't version 27–267 MB blobs
- `~/.config/helix/runtime/grammars/` — build artifacts; rebuild with `hx --grammar build`
- `~/.oh-my-zsh/`, `~/.zshrc.pre-oh-my-zsh` (installer backup), `.zcompdump*` (regenerated)
- `systemd/user/9router.service` — path pins a specific fnm node version; revisit when stable
