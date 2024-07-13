{ pkgs, ... }:

{

  imports = [
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    brave
    libreoffice
    filezilla
    mockoon

    # NOTE: proprietary software sometimes has problem with nix packages, prefer use flatpak
    # postman
    # slack
    # redisinsight
  ];
}
