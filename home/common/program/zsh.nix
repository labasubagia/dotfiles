{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      mv = "mv -iv";
      cp = "cp -iv";
      rm = "trash-put -iv";
      cat = "bat";
      tree = "eza --tree";
      grep = "rg";
      du = "dust";
      find = "fd";
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
}
