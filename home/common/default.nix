{ pkgs, ... }:

{
  imports = [
    ./ansible.nix
    ./app-cli.nix
    ./atuin.nix
    ./autojump.nix
    ./neovim.nix
    ./nerd-fonts.nix
    ./starship.nix
    ./zsh.nix
  ];
}
