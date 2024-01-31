{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
  ];

  home.packages = with pkgs; [
  ];
}
