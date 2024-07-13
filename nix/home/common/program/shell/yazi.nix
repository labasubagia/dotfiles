{ pkgs, config, globalConfig, ... }:
{
  home.packages = with pkgs; [
    file
    (nerdfonts.override { fonts = globalConfig.font.nerdfonts.list; })
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
    settings = {
      opener = {
        edit = [
          { run = "${pkgs.neovim}/bin/nvim \"$@\""; block = true; }
        ];
      };
    };
  };
}
