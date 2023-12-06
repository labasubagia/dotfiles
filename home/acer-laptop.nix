{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/wm/i3
  ];

  home.packages = with pkgs; [
  ];
}
