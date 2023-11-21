{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    (inputs.nixpkgs + "/nixos/modules/installer/virtualbox-demo.nix")
    ../common/xfce.nix
  ];

  # Let demo build as a trusted user.
  # nix.settings.trusted-users = [ "demo" ];

  # Mount a VirtualBox shared folder.
  # This is configurable in the VirtualBox menu at
  # Machine / Settings / Shared Folders.
  # fileSystems."/mnt" = {
  #   fsType = "vboxsf";
  #   device = "nameofdevicetomount";
  #   options = [ "rw" ];
  # };

  # By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
  # If you prefer another desktop manager or display manager, you may want
  # to disable the default.
  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.pulseaudio = true;


  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.defaultSession = "xfce";

  # Enable GDM/GNOME by uncommenting above two lines and two lines below.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # \$ nix search wget
  environment = with pkgs; {
    systemPackages = [
      zsh
    ];
    shells = [ zsh ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  time.timeZone = "Asia/Makassar";
}
