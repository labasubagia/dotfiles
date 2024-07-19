{ pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./xdg.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    ./firewall.nix
    ./nix-ld.nix
    ./networking.nix
    ./vm.nix
  ];
}
