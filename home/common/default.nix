{pkgs, ...}:

{
  imports = [
    ./app-cli.nix
    ./autojump.nix
    ./development.nix
    ./neovim.nix
    ./nerd-fonts.nix
    ./starship.nix
    ./zsh.nix
  ];
}
