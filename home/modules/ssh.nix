{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    # Make sure keys same as ssh.yml
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
