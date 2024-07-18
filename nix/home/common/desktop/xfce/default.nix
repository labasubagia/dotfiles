{ pkgs, globalConfig, ... }:

{
  home.packages = with pkgs; [
    cinnamon.xreader # pdf
    gnome.file-roller # archive
    galculator # calculator
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "elementary Xfce dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    cursorTheme = {
      name = "elementary";
      package = pkgs.elementary-xfce-icon-theme;
    };
    font = {
      name = globalConfig.font.family.sans;
      package = pkgs.source-sans;
    };
    theme = {
      name = "Zukitre";
      package = pkgs.zuki-themes;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=0
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=0
      '';
    };
  };
}
