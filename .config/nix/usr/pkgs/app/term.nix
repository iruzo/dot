{ config, pkgs, ... }:

{

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "Red Hat Mono";
      package = pkgs.redhat-official-fonts;
      size = 10;
    };
    settings = {
      confirm_os_window_close = "0";

      font_size = "10.0";
      font_family = "Red Hat Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      background_opacity = "0.6";

      foreground = "#CAD3F5";
      background = "#24273A";
      selection_foreground = "#24273A";
      selection_background = "#F4DBD6";

      cursor = "#F4DBD6";
      cursor_text_color = "#24273A";

      url_color = "#F4DBD6";

      active_border_color = "#B7BDF8";
      inactive_border_color = "#6E738D";
      bell_border_color = "#EED49F";

      active_tab_foreground = "#181926";
      active_tab_background = "#C6A0F6";
      inactive_tab_foreground = "#CAD3F5";
      inactive_tab_background = "#1E2030";
      tab_bar_background = "#181926";

      mark1_foreground = "#24273A";
      mark1_background = "#B7BDF8";
      mark2_foreground = "#24273A";
      mark2_background = "#C6A0F6";
      mark3_foreground = "#24273A";
      mark3_background = "#7DC4E4";

      color0 = "#494D64";
      color8 = "#5B6078";

      color1 = "#ED8796";
      color9 = "#ED8796";

      color2 = "#A6DA95";
      color10 = "#A6DA95";

      color3 = "#EED49F";
      color11 = "#EED49F";

      color4 = "#8AADF4";
      color12 = "#8AADF4";

      color5 = "#F5BDE6";
      color13 = "#F5BDE6";

      color6 = "#8BD5CA";
      color14 = "#8BD5CA";

      color7 = "#B8C0E0";
      color15 = "#A5ADCB";
    };
  };

  # programs.wezterm.enable = true;

  # xdg.configFile = {
  #   "wezterm/wezterm.lua".source = mkSymlink "wezterm.lua";
  #   "wezterm/config" = {
  #     source = mkSymlink "config";
  #     recursive = true;
  #   };
  # };

}
