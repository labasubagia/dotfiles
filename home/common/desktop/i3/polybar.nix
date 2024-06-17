{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    polybar
  ];

  xsession.windowManager.i3.config = {
    bars = [ ];
    startup = [
      { command = "--no-startup-id bash $HOME/.config/polybar/launch.sh"; always = true; }
    ];
  };

  xdg.configFile."polybar/launch.sh".text = "
    #!/usr/bin/env bash

    # Terminate already running bar instances
    # If all your bars have ipc enabled, you can use
    polybar-msg cmd quit
    # Otherwise you can use the nuclear option:
    # killall -q polybar

    echo \"---\" | tee -a /tmp/polybar.log
    polybar top -r 2>&1 | tee -a /tmp/polybar.log & disown

    echo \"Bars launched...\"
  ";

  xdg.configFile."polybar/config.ini".source = ./polybar.config.ini;
}
