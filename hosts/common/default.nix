{ pkgs, ... }:

{
  imports = [
    ./xdg.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
  ];
}