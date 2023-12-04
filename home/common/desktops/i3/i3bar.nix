{ pkgs, ... }:

{
  home.packages = with pkgs; [
    i3blocks
    i3status
  ];

  xsession.windowManager.i3.config = {
    bars = [
      {
        position = "top";
        statusCommand = "${pkgs.i3status}/bin/i3status";
        hiddenState = "hide";
        mode = "dock";
        workspaceButtons = true;
        trayOutput = "primary";
      }
    ];
  };

  programs.i3status = {
    enable = true;
    general = {
      interval = 1;
    };
    modules = {
      "ipv6" = {
        enable = false;
      };
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
          device = "pulse";
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
}
