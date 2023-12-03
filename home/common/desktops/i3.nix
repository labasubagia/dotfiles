{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    config = {
      gaps = "5px";
      terminal = "alacritty";
    };
  };
}
