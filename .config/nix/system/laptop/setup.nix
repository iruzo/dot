{ config, pkgs, lib, ... }:

{

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hdw.nix
    ./net.nix
    ./nix.nix
    ./gui/sway.nix
    ./app.nix
  ];

  programs.ssh.startAgent = true;

  users.users.amnesia = {
    isNormalUser = true;
    shell = pkgs.yash;

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
      foot                # terminal emulator
      neovim
    ];

  };

  # keyboard and internationalisation properties
  console.keyMap      = "us";
  i18n.defaultLocale  = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT    = "es_ES.UTF-8";
    LC_MONETARY       = "es_ES.UTF-8";
    LC_NAME           = "es_ES.UTF-8";
    LC_TELEPHONE      = "es_ES.UTF-8";
    LC_NUMERIC        = "en_US.UTF-8";
    LC_PAPER          = "en_US.UTF-8";
    LC_TIME           = "en_US.UTF-8";
  };
  time.timeZone = "Europe/Madrid";

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      # anurati
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      (nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
      # pkgs.nur.repos.nekowinston.apple-sf-mono
    ];
    fontconfig = {
      defaultFonts = {
        # serif = [ "SF Serif" ];
        # sansSerif = [ "SF Serif" ];
        # monospace = [ "SF Mono" ];
        serif = [ "Fira Code" ];
        sansSerif = [ "Fira Code" ];
        monospace = [ "Fira Code" ];
      };
    };
  };

  # this is required for mounting android phones over mtp://
  # services.gvfs.enable = true;

  system.stateVersion = "23.11";

}
