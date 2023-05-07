{ pkgs, ... }:

{
  imports =  [
    ./global
    ./gui

    # Currently using ansible for create & config ssh
    # ./config/ssh.nix
  ];
}
