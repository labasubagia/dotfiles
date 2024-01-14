{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
    ./common/wm/i3
  ];

  home.packages = with pkgs; [
  ];
}
