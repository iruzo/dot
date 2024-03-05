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

  environment.systemPackages = (with pkgs; [
    greetd.gtkgreet
  ]);

  services = {
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
    gnome-session
    sh
  '';

}
