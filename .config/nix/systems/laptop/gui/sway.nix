{ config, pkgs, lib, ... }:

{

  programs.sway = {
    enable = true;
    package = (
      pkgs.swayfx.overrideAttrs (old: { passthru.providedSessions = [ "sway" ]; })
    );
    extraPackages = with pkgs; [
      swaynotificationcenter
      swaylock
      wl-clipboard
      bemenu
      grim
      slurp
      brightnessctl

      pcmanfm
      gnome.gnome-logs
      gnome.gnome-boxes
    ];
  };
  services.gvfs.enable = true;        # needed for pcmanfm
  services.udisks2.enable = true;     # needed for gnome-disks
  programs.gnome-disks.enable = true; # gnome-disks

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Enable Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

}
