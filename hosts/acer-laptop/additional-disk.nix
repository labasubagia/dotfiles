{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-label/shared";
    fsType = "ntfs";
    options = [ "rw" "uid=1000"];
  };
}
