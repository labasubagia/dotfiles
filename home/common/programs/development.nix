{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
    pre-commit

    gcc
    go
    rustup
    nodejs
    nodePackages.pnpm
  ];
}
