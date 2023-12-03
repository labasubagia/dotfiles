{ pkgs, user, ... }:

{
  home.packages = with pkgs; [
    nitrogen
  ];

  home.file.".config/nitrogen/wallpaper".source = ./../../../../extras/wallpaper;

  home.file.".config/nitrogen/nitrogen.cfg".text = "
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
    dirs=/home/${user}/.config/nitrogen/wallpaper;
  ";

  home.file.".config/nitrogen/bg-saved.cfg".text = "
    [xin_-1]
    file=/home/${user}/.config/nitrogen/wallpaper/1.jpg
    mode=0
    bgcolor=#000000
  ";
}
