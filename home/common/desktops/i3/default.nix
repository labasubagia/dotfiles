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
    modules = {
      "wireless _first_" = {
        position = 1;
        settings = {
          format_up = "W: (%quality at %essid) %ip";
          format_down = "W: down";
        };
      };
      "ethernet _first_" = {
        position = 2;
        settings = {
          format_up = "E: %ip (%speed)";
          format_down = "E: down";
        };
      };
      "battery all" = {
        position = 3;
        settings = {
          format = "%status %percentage %remaining";
        };
      };
      "disk /" = {
        position = 4;
        settings = {
          format = "/ %avail";
        };
      };
      "load" = {
        position = 5;
        settings = {
          format = "%1min";
        };
      };
      "memory" = {
        position = 6;
        settings = {
          format = "%used | %available";
          threshold_degraded = "1G";
          format_degraded = "MEMORY < %available";
        };
      };
      "volume master" = {
        position = 7;
        settings = {
          format = "♪: %volume";
          format_muted = "♪: muted (%volume)";
          device = "pulse:1";
        };
      };
      "tztime local" = {
        position = 8;
        settings = {
          format = "%Y-%m-%d %H:%M:%S";
        };
      };
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
