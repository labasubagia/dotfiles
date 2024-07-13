{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 8;
      };
      window = {
        opacity = 0.8;
        padding = {
          x = 4;
          y = 4;
        };
      };
    };
  };
}
