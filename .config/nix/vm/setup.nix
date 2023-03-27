{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hdw.nix
      ./net.nix
      ./usr.nix
      ./nix.nix
    ];

  # Clear /tmp during boot
  boot.cleanTmpDir = true;

  # Use latest kernel
  # boot.kernelPackages will use linuxPackages by default, so no need to define it
  nixpkgs.config.packageOverrides = in_pkgs :
  {
    linuxPackages = in_pkgs.linuxPackages_latest;
  };

  # No access time and continuous TRIM for SSD
  fileSystems."/".options = [ "noatime" "discard" ];

  # If non-empty, write log messages to the specified TTY device.
  services.journald.console = "/dev/tty12";

  # Sysctl params
  # boot.kernel.sysctl = {
  #   "fs.inotify.max_user_watches" = 524288; # Allow VS Code to watch more files
  # };

  # A DBus service that allows applications to update firmware
  services.fwupd.enable = true;

  # Enable entropy daemon which refills /dev/random when low
  services.haveged.enable = true;

  # keyboard
  console.font = "Fira Code"; # Big console font for HiDPI
  console.keyMap = "us";
  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Europe/Madrid";

  # Use the systemd-timesyncd SNTP client to sync the system clock (enabled by default)
  services.timesyncd.enable = true;

  # Disable sudo password for the wheel group
  # security.sudo.wheelNeedsPassword = false;

  # Allow "unfree" packages.
  nixpkgs.config.allowUnfree = true;

  # Periodically update the database of files used by the locate command
  services.locate.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  # This does NOT define the NixOS version. The channel does.
  # https://nixos.wiki/wiki/FAQ#When_do_I_update_stateVersion
  # https://nixos.org/manual/nixos/stable/release-notes.html
  # check older pkg versions: https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=xdg-desktop-portal
  system.stateVersion = "22.11"; # Did you read the comment?

}
