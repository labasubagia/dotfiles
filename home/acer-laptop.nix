{ pkgs, ... }:

{
  imports =  [
    ./global
    ./gui
    ./development

    # Currently using ansible for create & config ssh
    # ./config/ssh.nix
  ];
}
