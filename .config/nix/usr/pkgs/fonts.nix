{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    # anurati
    (nerdfonts.override {fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ];})
    cascadia-code
    victor-mono
    ibm-plex
    xkcd-font
  ];

}
