{ pkgs, global-config, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      ubuntu_font_family
      source-sans
      (nerdfonts.override { fonts = global-config.font.nerdfonts.list; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ global-config.font.family.sans ];
        sansSerif = [ global-config.font.family.sans_serif ];
        monospace = [ global-config.font.family.monospace ];
      };
    };
  };
}
