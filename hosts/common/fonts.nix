{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      ubuntu_font_family
      source-sans
      nerdfonts
      # (nerdfonts.override { fonts = [ "RobotoMono" "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Source Sans 3" ];
        sansSerif = [ "Source Sans 3" ];
        monospace = [ "RobotoMono Nerd Font" ];
      };
    };
  };
}
