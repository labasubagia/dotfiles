{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pip
      # ! don't use ansible from nix (pkgs.ansible),
      # ! it's become troublesome when we need to use additional packages e.g. paramiko
      ansible-core
      paramiko
    ]))
  ];
}
