{ pkgs, ... }:

{
  imports =  [
    ./global
    ./gui
    ./config/ssh.nix
  ];
}
