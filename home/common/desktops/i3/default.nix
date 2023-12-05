{ pkgs, user, config, lib, ... }:
let
  font = "Source Sans";
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
    rofi
    libnotify
    lxappearance
    killall
    pulseaudio
    cava
    neofetch
  ];

  gtk = {
    font = {
      package = pkgs.source-sans;
      name = font;
      size = 10;
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      defaultWorkspace = "1";
      window = {
        hideEdgeBorders = "both";
      };
      fonts = {
        names = [ font ];
        size = 9.0;
      };
      colors = {
        focused = { };
        focusedIncactive = { };
        unfocused = { };
        urgent = { };
        placeholder = { };
        background = { };
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
          "${modifier}+d" = "exec rofi -show drun";
          "Mod1+RightClick" = "mode resize";

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
    extraConfig = "
      default_border pixel 3
      default_floating_border pixel 3
    ";
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
