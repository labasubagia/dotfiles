{ pkgs, config, ... }:
let wallpaper1 = "${./../../../../extras/wallpaper/1.png}"; in
{
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = "
    preload = ${wallpaper1}

    #set the default wallpaper(s) seen on initial workspace(s) --depending on the number of monitors used
    wallpaper = ,${wallpaper1}

    #enable splash text rendering over the wallpaper
    splash = true

    #fully disable ipc
    # ipc = off
  ";
}
