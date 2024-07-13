{ pkgs, ... }:

{
  # TODO: Learn iptables to enable docker container to connect to host
  networking.firewall = {
    enable = true;
  };
}
