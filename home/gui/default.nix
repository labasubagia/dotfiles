{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    vscode
    postman
  ];
}
