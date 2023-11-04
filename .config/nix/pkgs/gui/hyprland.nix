{ config, pkgs, lib, ... }:

{

  programs = {
    hyprland.enable = true;
  };

  environment.systemPackages = (with pkgs; [
    wl-clipboard
    gtklock
    swaynotificationcenter
    swaybg
    tofi
    (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true "]; }))
    grim
    slurp
    brightnessctl

    gnome.nautilus
    gnome.gnome-logs
    gnome.gnome-boxes
  ]);

  security.pam.services.gtklock = {   # needed for gtklock
    text = ''
      auth include login
    '';
  };
  services.gvfs.enable = true;        # needed for nautilus
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
