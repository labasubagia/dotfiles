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

    tokei
    trash-cli
    exa
    bat
    jq
    fd
    tree
  ];
}
