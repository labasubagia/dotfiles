{ pkgs, globalConfig, ... }:

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
      (nerdfonts.override { fonts = globalConfig.font.nerdfonts.list; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ globalConfig.font.family.sans ];
        sansSerif = [ globalConfig.font.family.sans_serif ];
        monospace = [ globalConfig.font.family.monospace ];
      };
    };
  };
}
