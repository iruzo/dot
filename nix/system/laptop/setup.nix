{ config, pkgs, lib, ... }:

{

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hdw.nix
    ./net.nix
    ./nix.nix
    ./gui/gnome.nix
    ./app.nix
  ];

  programs.ssh.startAgent = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions = {
      enable = true;
      async = true;
    };
  };

  users.defaultUserShell = pkgs.dash;
  users.users.amnesia = {
    isNormalUser = true;
    shell = pkgs.zsh;

    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "video"
      "audio"
      "networkmanager"
      "libvirtd"
      # "docker" "lxd" # Allow access to the sockets without root
    ];

    packages = with pkgs; [
      home-manager
      git
      neovim
    ];

  };

  # keyboard and internationalisation properties
  console.keyMap      = "us";
  i18n = {
    defaultLocale  = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS        = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT    = "es_ES.UTF-8";
      LC_MONETARY       = "es_ES.UTF-8";
      LC_NAME           = "es_ES.UTF-8";
      LC_TELEPHONE      = "es_ES.UTF-8";
      LC_NUMERIC        = "es_ES.UTF-8";
      LC_PAPER          = "es_ES.UTF-8";
      LC_TIME           = "es_ES.UTF-8";
    };
  };
  time.timeZone = "Europe/Madrid";

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      redhat-official-fonts
      # anurati
      # pkgs.nur.repos.nekowinston.apple-sf-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Red Hat Mono" ];
        sansSerif = [ "Red Hat Mono" ];
        monospace = [ "Red Hat Mono" ];
        # serif = [ "SF Serif" ];
        # sansSerif = [ "SF Serif" ];
        # monospace = [ "SF Mono" ];
      };
    };
  };

  system.stateVersion = "23.11";

}
