# dotfiles (GNU Stow)

One directory per stow package; layout inside each mirrors `$HOME`.
`./install.sh` symlinks everything into `$HOME`.

| package | provides |
|---|---|
| `zsh` | `~/.zshrc` (oh-my-zsh + autosuggestions/highlighting + fnm) |
| `helix` | `~/.config/helix/{config,languages}.toml` (theme: tokyonight) |
| `npm` | `~/.npmrc` (`allow-scripts=9router`) |
| `herdr` | `~/.config/herdr/config.toml` (theme: tokyo-night) |
| `omp` | `~/.omp/agent/{config,models}.yml` (theme: dark-catppuccin, symbolPreset: nerd; 9Router provider, key via `$NINE_ROUTER_API_KEY` in untracked `~/.omp/.env`) |
| `9router` | `~/.config/systemd/user/9router.service` (local gateway on fnm-managed node via `default` alias; enable with `systemctl --user enable --now 9router`) |

`omp`: only `agent/{config,models}.yml` versioned; named profiles, `agent.db`/`models.db`, session state excluded.

## Usage

```sh
./install.sh            # (re)stow all packages into $HOME
stow -t ~ <pkg>         # single package, e.g. stow -t ~ helix
stow -t ~ -D <pkg>      # unstow one package
./install.sh --adopt    # pull live $HOME files back into repo, then review with git diff
prek install            # one-time: enable git hooks (lints + gitleaks run on every commit)
```

Fresh machine: `git clone <url> ~/dotfiles && cd ~/dotfiles && ./install.sh`.
Requires `stow` + `oh-my-zsh` (zsh package assumes `$HOME/.oh-my-zsh`) + `fnm` (Node.js installed via fnm; the 9router unit runs off the `default` alias).

## Deliberately excluded

- Secrets: `~/.config/9router/env` (dashboard password), `~/.omp/.env` (9Router API key), `~/.config/opencode/service.json`
- Machine state: herdr logs/socks, go telemetry, ubuntu-insights consent, empty compose dir
- Binaries: `~/.local/bin/{herdr,omp,uv,uvx}` — reinstall per machine, don't version 27–267 MB blobs
- `~/.config/helix/runtime/grammars/` — build artifacts; rebuild with `hx --grammar build`
- `~/.oh-my-zsh/`, `~/.zshrc.pre-oh-my-zsh` (installer backup), `.zcompdump*` (regenerated)
