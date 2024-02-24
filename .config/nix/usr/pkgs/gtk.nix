{ config, lib, pkgs, ...}:

let

  themeDir = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}";

in {

  home.pointerCursor = {
    name = "Catppuccin-Macchiato-Lavender-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoLavender;
  };

  xdg = {
    configFile."gtk-4.0/assets" = {
      source = "${themeDir}/gtk-4.0/assets";
      recursive = true;
    };
    configFile."gtk-4.0/gtk.css".source = "${themeDir}/gtk-4.0/gtk.css";
    configFile."gtk-4.0/gtk-dark.css".source = "${themeDir}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = false;
    platformTheme = "gtk";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;
    iconTheme = {
       name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "macchiato";
          accent = "lavender";
        };
    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "macchiato";
      };
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Catppuccin-Macchiato-Lavender-Cursors";
    };
  };

}
