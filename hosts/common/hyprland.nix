{ pkgs, ... }: {

  # services.xserver.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [ ];
}
