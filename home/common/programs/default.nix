{ pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./autojump.nix
    ./cli.nix
    ./development.nix
    ./gui.nix
    ./neovim.nix
    ./nerd-fonts.nix
    ./python.nix
    ./starship.nix
    ./zsh.nix

    ./kitty.nix
    ./waybar.nix
    ./wofi.nix
  ];
}
