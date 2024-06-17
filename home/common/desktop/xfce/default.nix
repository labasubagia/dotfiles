{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xed-editor
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
