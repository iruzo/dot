{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  imports = [ ./pkgs ];

  home = {
    username = "amnesia";
    homeDirectory = "/home/amnesia";
    stateVersion = "23.11";
    packages = with pkgs; [
      xdg-utils
      xdg-user-dirs

      curl
      unzip

      dash
      man
      git
      btop                   # system monitor
      bemenu                 # fuzzy menu
      sshfs                  # mount dirs through ssh
      helvum                 # control connections between audio inputs and outputs
      pavucontrol            # pulse audio volume control
      noisetorch             # noise supression
      aerc                   # mail
      ripgrep                # finder
      calc                   # calculator
      keepassxc              # password manager
      zbar                   # bar code reader
      mpv                    # image and video
      obs-studio             # video-audio recorder
      zathura                # document viewer
      pandoc                 # document converter
      imagemagick            # terminal image editor
      transmission-gtk       # torrent
      tor-browser-bundle-bin # tor
      gimp                   # image editor
      libreoffice            # office
      mat2                   # clean metadata
      syncthing              # file synchronization

      # tools
      gcc
      python3

      # games
      prismlauncher

      # fonts
      redhat-official-fonts
    ];
    sessionVariables = {
      # GTK_THEME = "gruvbox-dark";
      # SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";

      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      XDG_STATE_HOME  = "$HOME/.local/state";

      # Not officially in the specification
      XDG_BIN_HOME = "$HOME/.local/bin";

      NIXOS_OZONE_WL = "1"; # force VSCode to run under wayland
    };
  };
  fonts.fontconfig.enable = true;

}
