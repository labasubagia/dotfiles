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
        serif = [ "Source Sans" ];
        sansSerif = [ "Source Sans" ];
        monospace = [ "IntoneMono Nerd Font" ];
      };
    };
  };
}
