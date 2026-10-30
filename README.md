# dotfiles (GNU Stow)

One directory per stow package; layout inside each mirrors `$HOME`.
`./install.sh` symlinks everything into `$HOME`.

| package | provides |
|---|---|
| `zsh` | `~/.zshrc` (oh-my-zsh + autosuggestions/highlighting + fnm) |
| `helix` | `~/.config/helix/{config,languages}.toml` (theme: tokyonight) |
| `npm` | `~/.npmrc` (`ignore-scripts=true`) |
| `herdr` | `~/.config/herdr/config.toml` (theme: tokyo-night) |
| `omp` | `~/.omp/agent/{config,keybindings}.yml` (theme: dark-tokyo-night, symbolPreset: nerd; Ctrl+L redraw) |
| `9router` | `~/.config/systemd/user/9router.service` (sandboxed local gateway, state in `~/.9router`) + `~/.config/9router/env.example` |
| `headroom` | `~/.config/systemd/user/headroom.service` (sandboxed AI proxy on 127.0.0.1:8787) |
| `lazygit` | `~/.config/lazygit/config.yml` (theme: tokyonight night; git diff pager: delta) |
| `git` | `~/.gitconfig` (delta pager, tokyonight diff theme) |
| `tmux` | `~/.tmux.conf` (C-b prefix, base-index 1, mouse, vi copy-mode, vim pane nav) |

## Required dependencies

Core tooling: [Git](https://git-scm.com/), [GNU Stow](https://www.gnu.org/software/stow/), [Python 3](https://www.python.org/) (pre-commit hooks).

| package | official |
|---|---|
| `zsh` | [zsh](https://www.zsh.org/) · [oh-my-zsh](https://ohmyz.sh/) · [fnm](https://github.com/Schniz/fnm) |
| `helix` | [helix-editor](https://helix-editor.com/) |
| `npm` | [Node.js / npm](https://nodejs.org/) via [fnm](https://github.com/Schniz/fnm) |
| `herdr` | [herdr](https://herdr.dev/) |
| `omp` | [omp](https://omp.sh/) |
| `9router` | [9Router](https://9router.com/) |
| `headroom` | [headroom](https://github.com/headroomlabs-ai/headroom) |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) |
| `git` | [delta](https://github.com/dandavison/delta) (+ git) |
| `tmux` | [tmux](https://github.com/tmux/tmux) |

Optional, auto-detected by `~/.zshrc`: [eza](https://github.com/eza-community/eza), [bat](https://github.com/sharkdp/bat), [fzf](https://github.com/junegunn/fzf).

Binaries not versioned in this repo (see *Deliberately excluded*): `herdr`, `omp`, `headroom`, `delta`, `uv`, `uvx` — install per machine. After installing, run `systemctl --user enable --now 9router headroom`.

`omp`: only `agent/{config,keybindings}.yml` and `agent/skills/` versioned; named profiles, `agent.db`/`models.db`, session state and `models.yml` (tool-managed by 9router) excluded.

## Usage

```sh
./install.sh            # (re)stow all packages into $HOME (with --no-folding)
stow -t ~ <pkg>         # single package, e.g. stow -t ~ helix (.stowrc enforces --no-folding)
stow -t ~ -D <pkg>      # unstow one package
./install.sh --adopt    # pull live $HOME files back into repo, then review with git diff
prek install            # one-time: enable git hooks (lints + gitleaks run on every commit)
```

Fresh machine: `git clone <url> ~/dotfiles && cd ~/dotfiles && ./install.sh`.
Requires `stow` + `oh-my-zsh` (zsh package assumes `$HOME/.oh-my-zsh`) + `fnm` (Node.js installed via fnm; the 9router unit runs off the `default` alias).

## Deliberately excluded

- Secrets: `~/.config/9router/env` (template: `env.example` in the 9router package), `~/.omp/.env`, `~/.config/opencode/service.json`
- Machine state: herdr logs/socks, go telemetry, ubuntu-insights consent, empty compose dir
- Binaries: `~/.local/bin/{herdr,omp,uv,uvx}` — reinstall per machine, don't version 27–267 MB blobs
- `~/.config/helix/runtime/grammars/` — build artifacts; rebuild with `hx --grammar build`
- `~/.oh-my-zsh/`, `~/.zshrc.pre-oh-my-zsh` (installer backup), `.zcompdump*` (regenerated)
