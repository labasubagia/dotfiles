{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
    ./common/desktop/xfce
  ];

  home.packages = with pkgs; [
  ];
}
