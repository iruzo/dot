{ config, pkgs, ... }:

{
  fonts = {
    # enableDefaultFonts = true;
    # enableGhostscriptFonts = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      # noto-fonts
      # noto-fonts-cjk # chinese japanese and koreans characters
      # noto-fonts-emoji
      fira-code
      fira-code-symbols
    ];
  };
  # default shell for all users
  users.defaultUserShell = pkgs.dash;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  nixpkgs.overlays = [
    (final: prev: { qutebrowser = prev.qutebrowser.override { enableWideVine = true; }; })
  ];
  users.users.a = {
    password = "a";
    # group to users, createHome to true, home to /home/username, useDefaultShell to true, and isSystemUser to false.
    isNormalUser = true;
    shell = pkgs.yash;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "video"
      "audio"
      "networkmanager"
    ];
    packages = with pkgs; [
      man
      curl
      git
      unzip
      # helvum
      pavucontrol

      wezterm
      neovim
      qutebrowser
      librewolf

      qemu
      virt-manager
      iproute2
      iptables
    ];
  };
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock
      wl-clipboard
      bemenu
      grim
      slurp
    ];
  };
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # fetching and compiling from source example
  # nixpkgs.overlays = [(self: super: {
  #   xdg-desktop-portal-wlr = super.xdg-desktop-portal-wlr.overrideAttrs(oldAttrs: rec {
  #     src = fetchFromGitHub {
  #       owner = "emersion";
  #       repo = "xdg-desktop-portal-wlr";
  #       sha256 = "";
  #       rev = "a18bea8461bc6f9fda68bf54dd77f2189f644ca5";
  #     };
  #     patches = [];
  #   });
  # })];

  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };

}
