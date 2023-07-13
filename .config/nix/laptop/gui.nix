{ config, pkgs, ... }:

{

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock
      wl-clipboard
      bemenu
      grim
      slurp
      brightnessctl

      gnome.nautilus
      gnome.gnome-logs
      gnome.gnome-boxes
      gnome.gnome-disk-utility
    ];
  };
  # programs.xwayland.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
