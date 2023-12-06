{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
    duf
    bottom
    gdu
    procs
    btop

    kubectl
    lazydocker
    k9s

    trash-cli
    xcp

    tokei
    eza
    bat
    jq
    fd
  ];
}
