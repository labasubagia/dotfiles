{pkgs, ...}:

{
  imports = [
    ./autojump.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./zsh.nix
  ];
}
