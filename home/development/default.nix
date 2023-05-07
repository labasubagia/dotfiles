{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    go
    rustup
    nodejs
    nodePackages.pnpm
  ];
}
