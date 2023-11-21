{ pkgs, ... }: {

  programs.waybar = {
    enable = true;
    style = ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}

      window#waybar {
        background: transparent;
        border-bottom: none;
      }

      #workspaces button.focused {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }
    '';
    settings = [
      {
        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "modules-center" = [ "hyprland/window" ];
      }
    ];
  };
}
