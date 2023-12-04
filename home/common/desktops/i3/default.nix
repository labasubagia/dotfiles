{ pkgs, user, config, lib, ... }:
let
  colors = {
    bg-color = "#523d64";
    in-bgcolor = "#363636";
    text = "#ffffff";
    u-bgcolor = "#ff0000";
    indicator = "#a8a3c1";
    in-text = "#969696";
  };
in
{
  imports = [
    ./nitrogen.nix
    ./polybar.nix
  ];

  home.packages = with pkgs; [
    i3lock
    networkmanagerapplet
    nitrogen
    ranger
    brightnessctl
    dmenu
    libnotify
    lxappearance
    killall
    pulseaudio
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      defaultWorkspace = "1";
      window = {
        hideEdgeBorders = "smart";
      };
      colors = {
        focused = {
          border = colors.bg-color;
          background = colors.bg-color;
          text = colors.indicator;
          indicator = colors.indicator;
          childBorder = colors.bg-color;
        };
      };
      modifier = "Mod4";
      gaps = {
        inner = 10;
      };
      terminal = "alacritty";
      startup = [
        { command = "--no-startup-id nm-applet"; }
        { command = "nitrogen --restore"; always = true; }

        # enable this to sclae resolution
        { command = "--no-startup-id xrandr --output $(xrandr | grep connected | grep -v disconnected | awk '{print $1}') --scale 1.2x1.2"; }
      ];
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in
        lib.mkOptionDefault {
          # volume
          # XF86AudioRaiseVolume = "exec amixer set Master 5%+ unmute";
          # XF86AudioLowerVolume = "exec amixer set Master 5%- unmute";
          # XF86AudioMute = "exec amixer set Master toggle";

          # volume
          XF86AudioRaiseVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
          XF86AudioLowerVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
          XF86AudioMute = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
          XF86AudioMicMute = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

          # brightness
          XF86MonBrightnessDown = "exec brightnessctl s 5%-";
          XF86MonBrightnessUp = "exec brightnessctl s +5%";
        };
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        transparency = 10;
        offset = "10x20";
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
