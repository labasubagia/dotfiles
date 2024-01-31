{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
    ./common/wm/hyprland
  ];

  home.packages = with pkgs; [
  ];
}
