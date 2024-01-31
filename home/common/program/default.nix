{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./cli.nix
    ./development.nix
    ./gui.nix
    ./neovim.nix
    ./ranger.nix
    ./starship.nix
    ./zsh.nix
  ];
}
