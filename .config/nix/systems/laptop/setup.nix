{ config, pkgs, lib, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./hdw.nix
      ./net.nix
      ./gui/hyprland.nix
      # ./gui/dwl.nix
      ./nix.nix
    ];

  fileSystems."/".options = [ "noatime" "discard" ];

  # keyboard and internationalisation properties
  console.keyMap = "us";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };
  time.timeZone = "Europe/Madrid";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # this is required for mounting android phones over mtp://
  # services.gvfs.enable = true;

  system.stateVersion = "23.05";

}