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

    # node
    nodejs
    nodePackages.pnpm

    # python
    (python3.withPackages (ps: with ps; [
      pip
      # ! don't use ansible from nix (pkgs.ansible),
      # ! it's become troublesome when we need to use additional packages e.g. paramiko
      ansible-core
      paramiko
    ]))
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
