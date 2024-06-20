{ pkgs, ... }:

{
  home.packages = with pkgs; [
    distrobox
  ];

  home.file."distrobox.ini".text = ''
    [my-ubuntu]
    additional_packages="zsh fish"
    image=docker.io/library/ubuntu:22.04
    pull=true

    [my-kali]
    additional_packages="zsh fish"
    image=docker.io/kalilinux/kali-rolling:latest
    pull=true
  '';
}
