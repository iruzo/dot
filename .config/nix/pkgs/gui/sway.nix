{ config, pkgs, lib, ... }:

# wallpaper
# set $wallpaper https://raw.githubusercontent.com/iruzo/wp/main/original-anime-cyberpunk-edgerunners.png
# exec_always if [  ! -f ~/.local/share/sway/wallpaper ]; then $(mkdir -p ~/.local/share/sway/wallpaper && curl $wallpaper -o ~/.local/share/sway/wallpaper); && sleep 1 fi
# output * bg ~/.local/share/sway/wallpaper fill
let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "GTK_THEME='Adwaita:dark' ${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit; pkill wvkbd"
    exec "${pkgs.wvkbd}/bin/wvkbd-mobintl -l simple,special"
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
  '';
in
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
      wvkbd

      # gnome.nautilus
      gnome.gnome-logs
      gnome.gnome-boxes

      greetd.gtkgreet

      # egl-wayland # needed for nvidia
    ];
  };
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    gnome-disks.enable = true; # gnome-disks
  };
  services = {
    gvfs.enable = true;         # needed for nautilus, pcmanfm and thunar to mount devices
    udisks2.enable = true;      # needed for gnome-disks
    tlp.enable = true;          # performance
    # auto-cpufreq.enable = true; # performance
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''
            ${pkgs.sway}/bin/sway --config ${swayConfig}
            '';
        };
      };
    };
  };
  environment.etc."greetd/environments".text = ''
    sway
    sh
  '';

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
