{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # ! don't use ansible from nix (pkgs.ansible),
    # ! it's become troublesome when we need to use additional packages e.g. paramiko
    (python3.withPackages(ps: with ps; [
      pip
      ansible-core
      paramiko
    ]))
  ];
}
