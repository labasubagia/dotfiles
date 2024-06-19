{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        lightdm = {
          enable = true;
          background = ../../extras/wallpaper/1.png;
          greeters.gtk = {
            enable = true;
            theme = {
              package = pkgs.zuki-themes;
              name = "Zukitre dark";
            };
            iconTheme = {
              name = "elementary Xfce dark";
              package = pkgs.elementary-xfce-icon-theme;
            };
            cursorTheme = {
              name = "elementary";
              package = pkgs.elementary-xfce-icon-theme;
            };
            indicators = [
              "~host"
              "~spacer"
              "~clock"
              "~spacer"
              "~session"
              "~a11y"
              "~power"
            ];
          };
        };
      };
      desktopManager.xfce.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.thunar-volman
  ];

  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
}
