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
      "editor.fontFamily" = "'IntoneMono Nerd Font','Droid Sans Mono', 'monospace', monospace";
      "window.menuBarVisibility" = "toggle";
      "editor.fontSize" = 13;
      "terminal.integrated.fontSize" = 13;
    };
  };
}
