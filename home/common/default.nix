{ pkgs, ... }:

{
  imports = [
    ./ansible.nix
    ./app-cli.nix
    ./atuin.nix
    ./autojump.nix
    ./development.nix
    ./neovim.nix
    ./nerd-fonts.nix
    ./starship.nix
    ./zsh.nix
  ];
}
