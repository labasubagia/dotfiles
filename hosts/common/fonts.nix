{ pkgs, global-config, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      ubuntu_font_family
      source-sans
      (nerdfonts.override { fonts = global-config.font.nerdfonts.list; })
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
