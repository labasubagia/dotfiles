# Nix Config

NixOS and Nix Config using flake

## Bootstrap

> NOTE: run this if git, home-manager don't exists and flake not enabled yet

```sh
$ nix-shell
```

## Run NixOS Configuration

Example using vbox hostname

```sh
$ sudo nixos-rebuild switch --flake .#vbox
```

## Run Home Manager Configuration

Example using vbox hostname and demo user

```sh
$ home-manager switch --flake .#demo@vbox
```

## After Run Config (Optional)

Optional step to run and it can be configured

### Add SSH Keys

Modify the file to meet your needs

```sh
# set ansible_python_interpreter vars bacause nixos path sometime troublesome
$ ansible-playbook extras/ansible/ssh.yml -e "ansible_pyhthon_interpreter=$(which python)"
```
