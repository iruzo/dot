{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    nerdfonts
    redhat-official-fonts
    # anurati
  ];

  # fonts.fontconfig.enable = true;
  fonts.fontconfig.enable = lib.mkForce true;

}
