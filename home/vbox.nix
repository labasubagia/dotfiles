{ pkgs, ... }:

{
  imports =  [
    ./default.nix

    # Currently using ansible for create & config ssh
    # ./config/ssh.nix
  ];
}
