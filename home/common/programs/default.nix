{ pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./autojump.nix
    ./alacritty.nix
    ./cli.nix
    ./development.nix
    ./gui.nix
    ./neovim.nix
    ./python.nix
    ./starship.nix
    ./zsh.nix
  ];
}
