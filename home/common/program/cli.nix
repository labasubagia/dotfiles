{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rar
    zip
    unzip

    arcanist
    git
    gh
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

  programs.atuin = {
    enable = true;
  };

  programs.autojump = {
    enable = true;
  };
}
