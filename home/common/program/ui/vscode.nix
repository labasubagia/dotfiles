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
      ms-vscode-remote.remote-containers
      eamodio.gitlens
      usernamehw.errorlens
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "devbox";
        publisher = "jetpack-io";
        version = "0.1.4";
        sha256 = "BVC7hS2PNcTHV6WIsWSiPQ9tV8aRlawQRnSHqqZcx1k=";
      }
    ];
    # userSettings = {
    #   "editor.fontFamily" = "'IntoneMono Nerd Font','Droid Sans Mono', 'monospace', monospace";
    #   "window.menuBarVisibility" = "toggle";
    #   "editor.fontSize" = 13;
    #   # "terminal.integrated.fontSize" = 13;
    # };
  };
}
