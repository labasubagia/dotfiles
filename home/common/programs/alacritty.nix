{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 7;
      };
      window = {
        opacity = 0.85;
        padding = {
          x = 2;
          y = 2;
        };
      };
    };
  };
}
