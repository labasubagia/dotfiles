# Nix Config

NixOS and Nix Config using flake

## Run NixOS Configuration

Example using vbox hostname

```sh
$ sudo nixos-rebuild switch --flake .#vbox
```

## Bootstrap

```sh
$ nix-shell
```

## Run Home Manager Configuration

Example using vbox hostname and demo user

```sh
$ home-manager switch --flake .#demo@vbox
```

## After

Several step need to run after rebuild

### Add ssh keys

Modify the file to configure ssh file

```sh
$ ansible-playbook extras/ansible/ssh.yml
```
