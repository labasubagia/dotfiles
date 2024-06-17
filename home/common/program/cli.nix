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
    kubectx
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

    alsa-utils
    brightnessctl
  ];

  programs.atuin = {
    enable = true;
    settings = {
      enter_accept = false;
      style = "compact";
    };
  };

  programs.autojump = {
    enable = true;
  };
}
