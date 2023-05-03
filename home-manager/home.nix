{ config, pkgs, inputs, user, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" "JetBrainsMono" ]; })

    # command line app
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "exa";
      ll = "exa -l";
      mv = "mv -iv";
      cp = "cp -iv";
      rm = "trash-put -iv";
      cat = "bat";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "davidde/git"; }
        { name = "themes/robbyrussell"; tags = [ from:oh-my-zsh as:theme ]; }
      ];
    };
  };

  programs.autojump = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # appearance
      vim-airline
      vim-devicons

      # utilities
      nerdtree
      editorconfig-vim
    ];
    extraConfig = ''
      set background=dark
      set clipboard=unnamedplus
      set cursorline
      set completeopt=noinsert,menuone,noselect
      set mouse=a
      set number
      set title
    '';
  };
}
