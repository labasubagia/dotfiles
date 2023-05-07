{ config, pkgs, inputs, user, ... }:

{

  imports = [ ./modules ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" "JetBrainsMono" ]; })

    # command line app
    asdf
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

    # development
    gcc
    go
    rustup
    nodejs
    nodePackages.pnpm
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
