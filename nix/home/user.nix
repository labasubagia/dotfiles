{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
    ./common/program/dev/distrobox.nix
    ./common/desktop/xfce
  ];

  home.packages = with pkgs; [
  ];
}
