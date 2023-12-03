{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 5;
      };
      terminal = "alacritty";
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
