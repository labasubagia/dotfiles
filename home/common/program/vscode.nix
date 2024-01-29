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
      ms-vscode-remote.vscode-remote-extensionpack
      eamodio.gitlens
      usernamehw.errorlens
      ms-azuretools.vscode-docker
    ];
    userSettings = {
      "editor.fontFamily" = "'IntoneMono Nerd Font','Droid Sans Mono', 'monospace', monospace";
      "window.menuBarVisibility" = "toggle";
      "editor.fontSize" = 13;
      "terminal.integrated.fontSize" = 13;
    };
  };
}
