{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./cli.nix
    ./development.nix
    ./gui.nix
    ./neovim.nix
    ./starship.nix
    ./yazi.nix
    ./zsh.nix
  ];
}
