{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      opacity = 0.9;
      font = {
        size = 10;
      };
    };
  };
}
