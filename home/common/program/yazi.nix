{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    nerdfonts
    ffmpegthumbnailer
    unar
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide

    # for alacritty
    ueberzugpp
  ];

  programs.yazi = {
    enable = true;
  };
}
