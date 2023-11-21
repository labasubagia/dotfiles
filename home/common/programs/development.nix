{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pre-commit

    gcc
    go
    rustup
    nodejs
    nodePackages.pnpm
  ];
}
