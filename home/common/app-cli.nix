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
    btop

    trash-cli
    xcp

    tokei
    eza
    bat
    jq
    fd
  ];
}
