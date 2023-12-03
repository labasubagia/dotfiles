{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 7.5;
      };
      window = {
        opacity = 0.9;
        padding = {
          x = 2;
          y = 2;
        };
      };
    };
  };
}
