{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/desktops/i3.nix
  ];

  home.packages = with pkgs; [

    # themes
    ant-theme
    plata-theme

    # icons
    arc-icon-theme
    colloid-icon-theme
    tela-icon-theme

    # fonts
    source-sans
  ];
}
