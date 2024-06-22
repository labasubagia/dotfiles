{ pkgs, user, config, lib, global-config, ... }:

{
  imports = [
    ./nitrogen.nix
    ./polybar.nix
    ./gtk.nix
    ./dunst.nix
    ../../program/ui/alacritty.nix
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


  xsession.windowManager.i3 = {
    enable = true;
    config = {
      defaultWorkspace = "1";
      window = {
        hideEdgeBorders = "both";
      };
      fonts = {
        names = [ global-config.font.family.sans ];
        size = 9.0;
      };
      colors = {
        # focused = { };
        # focusedInactive = { };
        # unfocused = { };
        # urgent = { };
        # placeholder = { };
        # background = { };
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

      set $rosewater #f5e0dc
      set $flamingo  #f2cdcd
      set $pink      #f5c2e7
      set $mauve     #cba6f7
      set $red       #f38ba8
      set $maroon    #eba0ac
      set $peach     #fab387
      set $green     #a6e3a1
      set $teal      #94e2d5
      set $sky       #89dceb
      set $sapphire  #74c7ec
      set $blue      #89b4fa
      set $lavender  #b4befe
      set $text      #cdd6f4
      set $subtext1  #bac2de
      set $subtext0  #a6adc8
      set $overlay2  #9399b2
      set $overlay1  #7f849c
      set $overlay0  #6c7086
      set $surface2  #585b70
      set $surface1  #45475a
      set $surface0  #313244
      set $base      #1e1e2e
      set $mantle    #181825
      set $crust     #11111b

      client.focused           $lavender $base $text  $rosewater $lavender
      client.focused_inactive  $overlay0 $base $text  $rosewater $overlay0
      client.unfocused         $overlay0 $base $text  $rosewater $overlay0
      client.urgent            $peach    $base $peach $overlay0  $peach
      client.placeholder       $overlay0 $base $text  $overlay0  $overlay0
      client.background        $base
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
      active-opacity = 0.8;
      frame-opacity = 0.8;
      inactive-opacity = 0.7;
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
