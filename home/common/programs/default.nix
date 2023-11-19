{ pkgs, ... }:

{
  imports = [
    ./ansible.nix
    ./atuin.nix
    ./autojump.nix
    ./cli.nix
    ./development.nix
    ./gui.nix
    ./neovim.nix
    ./nerd-fonts.nix
    ./starship.nix
    ./zsh.nix
  ];
}
