{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerdfonts
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      editorconfig.editorconfig
      streetsidesoftware.code-spell-checker
      jnoortheen.nix-ide
    ];
    userSettings = {
      "editor.fontFamily" = "'JetbrainsMono Nerd Font','Droid Sans Mono', 'monospace', monospace";
      "workbench.colorTheme" = "Visual Studio Dark";
      "window.menuBarVisibility" = "toggle";
      "editor.fontSize" = 13;
    };
  };
}
