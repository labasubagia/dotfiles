# this can use this to load ssh keys
# the main reason this config is not used yet is because the result is using symlink
# which don't work well when binding directory to containerization technologies e.g. dev container (I use this for development)
# current solution is to use ansible ssh-sops.yml

{ pkgs, config, lib, ... }:

let
  sshKeys = [
    { name = "github"; host = "github.com"; }
    { name = "gitlab"; host = "gitlab.com"; }

    # example one key for multiple host
    { name = "phabricator"; host = "phabricator.sirclo.com"; }
    { name = "phabricator"; host = "phabricator.other-host.com"; }
  ];
in
{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets.yaml;
    secrets = builtins.listToAttrs (
      lib.lists.unique (
        map
          (key: {
            name = "ssh_keys/${key.name}/private";
            value = {
              path = "${config.home.homeDirectory}/.ssh/id_ed25519_${key.name}";
            };
          })
          sshKeys
        ++
        map
          (key: {
            name = "ssh_keys/${key.name}/public";
            value = {
              path = "${config.home.homeDirectory}/.ssh/id_ed25519_${key.name}.pub";
            };
          })
          sshKeys
      )
    );
  };

  programs.ssh = {
    enable = true;
    matchBlocks = builtins.listToAttrs (
      map
        (key: {
          name = key.host;
          value = {
            hostname = key.host;
            identityFile = "~/.ssh/id_ed25519_${key.name}";
          };
        })
        sshKeys
    );
  };
}
