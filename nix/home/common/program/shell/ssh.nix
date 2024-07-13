# this can use this to load ssh keys
# the main reason this config is not used yet is because the result is using symlink
# which don't work well when binding directory to containerization technologies e.g. dev container (I use this for development)
# current solution is to use ansible ssh-sops.yml

{ pkgs, config, lib, globalConfig, sopsSecret, ... }:

let
  ageKeyAbsPath = builtins.replaceStrings [ "~" ] [ config.home.homeDirectory ] globalConfig.age.key_path;
  sshDirAbsPath = builtins.replaceStrings [ "~" ] [ config.home.homeDirectory ] globalConfig.ssh.dir_path;
  sshKeys = globalConfig.ssh.keys;
in
{
  sops = {
    age.keyFile = ageKeyAbsPath;
    defaultSopsFile = sopsSecret;
    secrets = builtins.listToAttrs (
      lib.lists.unique (
        map
          (key: {
            name = "ssh_keys/${key.name}/private";
            value = {
              path = "${sshDirAbsPath}/id_ed25519_${key.name}";
            };
          })
          sshKeys
        ++
        map
          (key: {
            name = "ssh_keys/${key.name}/public";
            value = {
              path = "${sshDirAbsPath}/id_ed25519_${key.name}.pub";
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
            identityFile = "${globalConfig.ssh.dir_path}/id_ed25519_${key.name}";
          };
        })
        sshKeys
    );
  };
}
