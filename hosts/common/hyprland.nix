{ pkgs, ... }: {

  # services.xserver.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.rofi-wayland
    pkgs.waybar
    pkgs.eww
    pkgs.dunst
    pkgs.swww
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];

  environment.sessionVariables = {
    # If your cursor becomes invisibe
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    # NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    # nvidia.modesetting.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
