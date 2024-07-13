{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nitrogen
  ];

  xdg.configFile."nitrogen/wallpaper".source = config.lib.file.mkOutOfStoreSymlink ../../../../../config/wallpaper;

  xdg.configFile."nitrogen/nitrogen.cfg".text = "
    [geometry]
    posx=5
    posy=23
    sizex=1352
    sizey=719

    [nitrogen]
    view=icon
    recurse=true
    sort=alpha
    icon_caps=false
    dirs=${config.xdg.configHome}/nitrogen/wallpaper;
  ";

  xdg.configFile."nitrogen/bg-saved.cfg".text = "
    [xin_-1]
    file=${config.xdg.configHome}/nitrogen/wallpaper/1.png
    mode=0
    bgcolor=#000000
  ";
}
