{ pkgs, ... }:

{
  imports = [
    ./nitrogen.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    nitrogen
    ranger
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 5;
      };
      terminal = "alacritty";
      startup = [
        { command = "--no-startup-id nm-applet"; }
        { command = "nitrogen --restore"; always = true; }
      ];
    };
  };

  programs.i3status = {
    enable = true;
    general = {
      interval = 1;
    };
  };

  services.picom = {
    enable = true;
    settings = {
      backend = "glx";
      inactive-opacity = 0.8;
      active-opacity = 0.8;
      frame-opacity = 0.8;
      blur = {
        method = "dual_kawase";
        strength = 9;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
    };
  };
}
