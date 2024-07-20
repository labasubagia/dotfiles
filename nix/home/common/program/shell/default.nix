{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./starship.nix
    ./yazi.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # secrets related
    age
    sops
    openssl
    gnupg
    ssh-to-age
    sshpass
    libsecret

    # archive
    rar
    zip
    xz
    unzip
    p7zip

    # git
    git
    gitleaks
    gh

    # networking tools
    mtr
    iperf3
    dnsutils # dig + dnslookup
    ldns
    socat
    nmap
    ipcalc
    aria2
    curl
    wget
    httpie

    # utils
    fzf
    ripgrep
    jq
    tokei
    bat
    fd
    trash-cli
    xcp
    eza
    yq-go
    tmux

    # resource stat
    du-dust
    duf
    gdu
    procs
    bottom
    htop
    btop
    iotop
    iftop

    # containerization utils
    kubectl
    kubectx
    lazydocker
    k9s

    # nix
    nix-output-monitor

    # media (audio, screen, etc)
    alsa-utils
    brightnessctl

    # misc
    neofetch
    file
    which
    gnused
    gnutar
    gawk
    zstd
    thefuck

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # sensors
    ethtool
    pciutils # lspci
    usbutils # lsusb
    dmidecode

    # android
    android-tools
    scrcpy
  ];

  programs = {
    atuin = {
      enable = true;
      settings = {
        enter_accept = false;
        style = "compact";
      };
    };
    zoxide = {
      enable = true;
      options = [ "--cmd j" ];
    };
    git = {
      enable = true;
      userEmail = "labasubagia22@gmail.com";
      userName = "Laba Subagia";
      aliases = {
        undo = "reset --soft HEAD~1";
      };
    };
  };

  services = {
    gnome-keyring = {
      enable = true;
    };
  };
}
