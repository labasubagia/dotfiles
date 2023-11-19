{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" "JetBrainsMono" ]; })
  ];
}
