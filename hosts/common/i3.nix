{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };

  programs.dconf.enable = true;

  desktopManager = {
    xterm.enable = true;
  };

  windowManager.i3 = {
    defaultSession = "none+i3";
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
      lxappearance
    ];
  };
}
