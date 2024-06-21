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
        version = "0.1.5";
        sha256 = "+nIeDaz1NPYFoxFVC8GQxtU1MU/sbdFETAQWzVX6LGQ=";
      }
      {
        name = "signageos-vscode-sops";
        publisher = "signageos";
        version = "0.9.1";
        sha256 = "b1Gp+tL5/e97xMuqkz4EvN0PxI7cJOObusEkcp+qKfM=";
      }
      {
        name = "signageos-vscode-sops-beta";
        publisher = "signageos";
        version = "0.9.1";
        sha256 = "p1gfMd6WgFpHJHmvBAmlpi+MH40xTnInlr6xOSFpVyI=";
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
