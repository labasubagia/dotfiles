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
      extraPackages = with pkgs; [ ];
    };
  };

  programs.dconf.enable = true;
}
