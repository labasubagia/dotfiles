{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asdf-vm
    ansible
    git
    curl
    wget
    htop
    tmux
    httpie
    trash-cli
    exa
    bat
    fzf
    ripgrep
    jq
    du-dust
    bottom
    fd
    gdu
    tokei
    procs
    tree
  ];
}
