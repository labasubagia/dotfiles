# DOTFILES

## Overview
This project aims to manage and configure a Linux environment using a combination of Ansible (mainly use for Debian) and Nix. By leveraging Ansible for general system configuration tasks and Nix for package management and reproducible builds, we ensure a robust, declarative setup for linux systems.

## Table of Contents
- [DOTFILES](#dotfiles)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Ansible](#ansible)
      - [Prerequisite](#prerequisite)
      - [Known Limitations](#known-limitations)
      - [Configure system](#configure-system)
    - [Nix](#nix)
      - [Prerequisite](#prerequisite-1)
      - [Configure system](#configure-system-1)
      - [Known Limitations](#known-limitations-1)
  - [License](#license)



## Getting Started
In this project, you have the flexibility to use Ansible, Nix, or a combination of both to configure your system. Each tool offers unique strengths, and using them together can provide a comprehensive, powerful approach to managing your environment.

### Ansible

#### Prerequisite
- [Python](https://www.python.org/)
- [Pip](https://pip.pypa.io/en/stable/installation) package manager required by Ansible
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), configuration management
- [Paramiko](https://www.paramiko.org/installing.html) for ssh
> Note: Example can be seen in [Makefile](./Makefile)

#### Known Limitations
- Ansible task currently not support for reading current path from task file, only accessible from `playbook_dir`. Workaround for this is using root of this project as `workdir`  variable that passed to all task-file.
- It's not as robust as nix, installation and deletion sometime break
- Linter sometime giving false positive message (some cases with path/directory related problem).
- PATH in shell often not updated while using ssh, so better develop using ssh for testing.

#### Configure system
- Copy inventory file
  ```bash
  cp ansible/inventory.example.yml ansible/inventory.yml
  ```
- Configure `inventory.yml` (just example)
  ```yaml
  debian: # can use other name
    hosts:
      your_host:
        ansible_host: 192.168.1.100 # better set static IP address
        ansible_user: user
        ansible_become_pass: password
        connection: ssh
        ansible_ssh_pass: password
  ```
- Option 1, Run specific task
  ```bash
  ansible-playbook ansible/playbooks/_handler.yml \
    -e workdir="$(git rev-parse --show-toplevel)" \
    -e task_file="ansible/tasks/tools/neovim/setup-common.yml" \
    -e '{"is_remove": false}' \
    -i ansible/inventory.yml
  ```
  > Note: leave `workdir` environment as it is
- Option 2, Run specific playbook for specific system
  ```bash
  # run by default using ssh
  ansible-playbook ansible/playbooks/debian.yml \
    -e workdir="$(git rev-parse --show-toplevel)" \
    -e '{"is_remove": false}' \
    -i ansible/inventory.yml

  # or run ansible against localhost
  ansible-playbook ansible/playbooks/nixos.yml \
    -e workdir="$(git rev-parse --show-toplevel)" \
    -e _hosts="localhost" \
    -e _connection="local" \
    -e '{"is_remove": false}' \
    -i ansible/inventory.yml
  ```
  > Note: leave `workdir` environment as it is

### Nix

#### Prerequisite
- [Nix Package Manager](https://nixos.org/download/) limited to [home-manager configuration](./nix/home/)
- [Home Manager](https://nix-community.github.io/home-manager/) managing user specific setting
- [NixOS](https://nixos.org/download) (Optional) can fully configured with [the configuration](./nix)
> Note: Example can be seen in [Nix Readme](./nix/README.md)

#### Configure system
- Move into [nix](./nix/)
  ```bash
  cd nix
  ```
- Example to configure NixOS (hostname=`vbox`)
  ```bash
  sudo nixos-rebuild switch --flake .#vbox
  ```
- Example configure Home-Manager (username=`demo`,hostname=`vbox`)
  ```bash
  home-manager switch --flake .#demo@vbox
  ```

#### Known Limitations
- Challenging to setup programming language development environment (sometime need to take a look to project like npm2nix, poetry2nix, etc)
- Nix mostly use symlink, which is difficult for binding into containerized apps (docker, dev-container)

## License
[MIT](./LICENSE)
