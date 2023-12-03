{ pkgs, ... }:

{

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = true;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        lxappearance
        nitrogen
        networkmanagerapplet
        ranger
        xfce.thunar
      ];
    };
  };

  programs.dconf.enable = true;
}
