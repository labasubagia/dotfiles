{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # development
    gcc
    go
    rustup
    nodejs
    nodePackages.pnpm
  ];
}
