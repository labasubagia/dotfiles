{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program
  ];
}
