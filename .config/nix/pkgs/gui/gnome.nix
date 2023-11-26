{ config, pkgs, lib, ... }:

{

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese           # webcam tool
    gnome-terminal   # terminal
    gedit            # text editor
    epiphany         # web browser
    geary            # email reader
    evince           # document viewer
    gnome-characters # characters
    totem            # video player
    iagno            # go game
    hitori           # sudoku game
    atomix           # puzzle game
  ]);

  environment.systemPackages = (with pkgs; [
    xclip
    gnome.gnome-boxes
    gnome.gnome-tweaks
    (catppuccin-gtk.override {
      accents = [ "lavender" ];
      size = "compact";
      tweaks = [ "rimless" "black" ];
      variant = "mocha";
    })
    gnomeExtensions.blur-my-shell
    # gnomeExtensions.dash-to-panel # turn dash into a bottom bar
    # gnomeExtensions.dash-to-dock # macos like dash
    gnomeExtensions.forge # tiling
    gnomeExtensions.vitals
    gnomeExtensions.bluetooth-battery
  ]);

  hardware.pulseaudio = {
    enable = true;
  };

}
