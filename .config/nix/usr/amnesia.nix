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

      man
      git
      btop                   # system monitor
      bemenu                 # fuzzy menu
      sshfs                  # mount dirs through ssh
      helvum                 # control connections between audio inputs and outputs
      pavucontrol            # pulse audio volume control
      noisetorch             # noise supression
      # wezterm                # terminal emulator
      foot                   # terminal emulator
      neovim                 # text editor
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
      # gpt4all                # run data models locally

      # tools
      gcc
      python3

      # games
      prismlauncher

      # (pkgs.chromium.override {
      #   commandLineArgs = [
      #     "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
      #     "--no-default-browser-check"
      #     "--no-service-autorun"
      #     "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
      #     # Autoplay policy
      #     "--document-user-activation-required"
      #     # Enable Wayland support
      #     "--enable-features=UseOzonePlatform"
      #     "--ozone-platform-hint=auto"
      #     # Disable global Google login
      #     "--disable-sync-preferences"
      #     # Reader mode
      #     "--enable-reader-mode"
      #     "--enable-dom-distiller"
      #     # Dark mode
      #     "--enable-features=WebUIDarkMode"
      #     # Security stuff
      #     "--disable-reading-from-canvas"
      #     "--no-pings"
      #     "--no-first-run"
      #     "--no-experiments"
      #     "--no-crash-upload"
      #     # Chromecast
      #     "--load-media-router-component-extension"
      #     # GPU stuff
      #     "--ignore-gpu-blocklist"
      #     "--enable-gpu-rasterization"
      #     #"--use-gl=egl"
      #     "--enable-zero-copy"
      #     # Accelerated decoding
      #     "--enable-features=VaapiVideoDecoder"

      #     "--disable-wake-on-wifi"
      #     "--disable-breakpad"
      #     "--disable-sync"
      #     "--disable-speech-api"
      #     "--disable-speech-synthesis-api"
      #   ];
      # })

      # (vscode-with-extensions.override {
      #   vscode = unstable.vscode;
      #   vscodeExtensions = with pkgs.vscodext.vscode-marketplace; [
      #     asvetliakov.vscode-neovim

      #     catppuccin.catppuccin-vsc
      #     catppuccin.catppuccin-vsc-icons

      #     ms-vscode-remote.remote-ssh
      #     ms-vscode-remote.remote-ssh-edit
      #     ms-azuretools.vscode-docker

      #     github.copilot
      #     github.copilot-chat
      #     github.vscode-pull-request-github
      #     github.vscode-github-actions
      #     github.remotehub
      #     gitlab.gitlab-workflow

      #     eamodio.gitlens                    # git
      #     usernamehw.errorlens               # error on lines
      #     pflannery.vscode-versionlens       # version checker
      #     christian-kohler.path-intellisense # path autocompletion
      #     aaron-bond.better-comments         # cool comments
      #     mintlify.document                  # autogenerate docs
      #     esbenp.prettier-vscode             # format code

      #     redhat.vscode-yaml
      #     rust-lang.rust-analyzer
      #     ms-python.python
      #     bbenoist.nix
      #   ];
      # })

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

}
