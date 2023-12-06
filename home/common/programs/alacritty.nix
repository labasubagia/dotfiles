{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        family = "JetBrainsMonoNL Nerd Font";
        size = 7;
      };
      window = {
        opacity = 0.85;
        padding = {
          x = 4;
          y = 4;
        };
      };
    };
  };
}
