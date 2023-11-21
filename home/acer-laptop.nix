{ pkgs, ... }:

{
  imports = [
    ./default.nix

    # Currently using ansible for create & config ssh
    # ./config/ssh.nix
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
