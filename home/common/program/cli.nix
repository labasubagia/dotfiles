{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rar
    zip
    unzip

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

    neofetch
    openssl
  ];

  programs.atuin = {
    enable = true;
  };

  programs.autojump = {
    enable = true;
  };
}
