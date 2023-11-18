{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asdf-vm

    rar
    zip
    unzip

    arcanist
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
