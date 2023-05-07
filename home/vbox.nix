{ config, pkgs, inputs, user, ... }:

{
  imports =  [
    ./global
    ./config/ssh.nix
  ];
}
