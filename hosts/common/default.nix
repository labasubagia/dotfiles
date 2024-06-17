{ pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./xdg.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    ./nix-ld.nix
  ];
}
