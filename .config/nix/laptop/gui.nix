{ config, pkgs, ... }:

{

  services.greetd = {
    enable = true;
    regreet.enable = true;
    settings = {
      default_session = {
        user = iruzo;
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
      };
    };
  };
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
