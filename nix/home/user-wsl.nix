{ pkgs, ... }:

{
  imports = [
    ./default.nix
    ./common/program/shell
    ./common/program/dev
  ];

  # error when home manager switch
  # failed download from 'https://git.sr.ht/~rycee/nmd/archive/824a380546b5d0d0eb701ff8cd5dbafb360750ff.tar.gz
  manual.manpages.enable = false;

  # in case conflict with WSL distro e.g ubuntu
  # when zsh is installed from apt instead of nixpkgs
  programs.zsh.initExtraFirst = "
    . $HOME/.nix-profile/etc/profile.d/nix.sh
  ";

  # enable flake in other distro e.g ubuntu
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
