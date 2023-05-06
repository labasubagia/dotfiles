# Nix Config

NixOS and Nix Config using flake

## how to run

```sh
$ sudo nixos-rebuild switch --flake .#vbox
```

## After run

Several step need to run after rebuild

### Add ssh keys (Required)

Make sure settings in home-manager/ssh.yml same as home-manager/home.nix

```sh
$ ansible-playbook home-manager/ssh.yml
```
