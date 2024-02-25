{ config, lib, pkgs, ...}:

let

  themeDir = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}";

in {

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Lavender-Cursors";
    package = pkgs.catppuccin-cursors.mochaLavender;
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
          accent = "lavender";
          flavor = "mocha";
        };
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "mocha";
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
      font-name = "Red Hat Text 10";
      monospace-font-name = "Red Hat Mono 10";
      cursor-theme = "Catppuccin-Mocha-Lavender-Cursors";
    };
    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
    };
    # keybindings
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>c" ];
      toggle-fullscreen = [ "<Super>f" ];
      move-to-monitor-left = [ "<Super><Shift>h" ];
      move-to-monitor-down = [ "<Super><Shift>j" ];
      move-to-monitor-up = [ "<Super><Shift>k" ];
      move-to-monitor-right = [ "<Super><Shift>l" ];
      switch-to-workspace-left = [ "<Super><Shift>Tab" ];
      switch-to-workspace-right = [ "<Super>Tab" ];
    };
    # rice
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "gnome-shell-pano@oae"
        "vitals@corecoding"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
    };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

}
