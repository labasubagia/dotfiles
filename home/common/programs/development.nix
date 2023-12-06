{ pkgs, stdenv, lib, ... }:

{
  home.packages = with pkgs; [
    # lsp
    rnix-lsp

    # git hooks
    pre-commit

    # build
    gcc
    gnumake

    go
    rustup
    nodejs
    nodePackages.pnpm
  ];

  # # asdf alternative
  # # https://github.com/jdx/rtx
  # # ! Don't use it, still have problem with several package e.g. nodejs
  # programs.rtx = {
  #   enable = true;

  #   settings = {
  #     env = {
  #       RTX_NODE_FORCE_COMPILE = "1";
  #     };

  #     tools = {
  #       node = "lts";
  #       pnpm = "latest";
  #       go = "latest";
  #     };

  #     settings = {
  #       verbose = true;
  #       experimental = false;
  #     };
  #   };
  # };
}
