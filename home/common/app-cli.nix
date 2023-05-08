{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asdf-vm

    git
    tmux

    curl
    wget
    httpie

    fzf
    ripgrep

    htop
    du-dust
    bottom
    gdu
    procs

    trash-cli
    xcp

    tokei
    exa
    bat
    jq
    fd
    tree
  ];
}
