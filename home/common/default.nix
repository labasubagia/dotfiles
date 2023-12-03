{ pkgs, ... }:

{
  imports = [
    ./programs
    ./desktop/i3.nix
  ];
}
