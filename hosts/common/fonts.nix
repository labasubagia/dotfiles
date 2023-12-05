{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      ubuntu_font_family
      nerdfonts
      # (nerdfonts.override { fonts = [ "RobotoMono" "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };
}
