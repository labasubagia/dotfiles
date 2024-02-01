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
    exiftool

    # for alacritty
    ueberzugpp
  ];

  programs.zoxide = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };
}
