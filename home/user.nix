{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
    ./common/program/distrobox.nix
    ./common/desktop/xfce
  ];

  home.packages = with pkgs; [
  ];
}
