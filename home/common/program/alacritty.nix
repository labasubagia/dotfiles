{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        family = "IntoneMono Nerd Font";
        size = 9;
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
