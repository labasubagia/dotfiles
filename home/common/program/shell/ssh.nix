{ pkgs, config, ... }:

{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets.yaml;
    secrets = {
      "ssh_keys/github/private" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_github";
      };
      "ssh_keys/github/public" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_github.pub";
      };

      "ssh_keys/gitlab/private" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_gitlab";
      };
      "ssh_keys/gitlab/public" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_gitlab.pub";
      };

      "ssh_keys/phabricator/private" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_phabricator";
      };
      "ssh_keys/phabricator/public" = {
        path = "${config.home.homeDirectory}/.ssh/id_rsa_phabricator.pub";
      };
    };

  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_rsa_github";
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = "~/.ssh/id_rsa_gitlab";
      };
      "phabricator.sirclo.com" = {
        hostname = "phabricator.sirclo.com";
        identityFile = "~/.ssh/id_rsa_phabricator";
      };
    };
  };
}
