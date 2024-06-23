{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    initExtraFirst = ''
      export PATH=$PATH:~/.local/bin

      # pnpm
      export PNPM_HOME="~/.local/share/pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
      # pnpm end
    '';
    shellAliases = {
      mv = "mv -iv";
      cp = "cp -iv";
      ls = "${pkgs.eza}/bin/eza";
      ll = "${pkgs.eza}/bin/eza -l";
      tree = "${pkgs.eza}/bin/eza --tree";
      rm = "${pkgs.trash-cli}/bin/trash-put -iv";
      cat = "${pkgs.bat}/bin/bat";
      grep = "${pkgs.ripgrep}/bin/rg";
      du = "${pkgs.dust}/bin/dust";
      find = "${pkgs.fd}/bin/fd";
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
        { name = "themes/robbyrussell"; tags = [ "from:oh-my-zsh" "as:theme" ]; }
      ];
    };
  };
}
