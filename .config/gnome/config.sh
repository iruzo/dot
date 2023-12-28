#!/bin/sh
##############################################################################
#            __              __  ___  ___  __   ___    __                    #
#           /__`  |\/|  /\  |__)  |  |__  |__) |__  | /__` |__|              #
#           .__/  |  | /~~\ |  \  |  |___ |  \ |    | .__/ |  |              #
#                                                                            #
##############################################################################
# Custom keybindings script for Pop!_shell, loosely based on i3 and Regolith #
##############################################################################
# WARNING: This script will change your gnome keybindings. If you are not    #
# using Pop!_shell, it will be useless.                                      #
# To reverse the effects of this, you can rest keybindings in the settings   #
# application.                                                               #
##############################################################################

gsettings set org.gnome.mutter dynamic-workspaces true

# First Let's name our vim keys to make things more readable later
left="h"
down="j"
up="k"
right="l"

# Define the dconf branches
KEYS_GNOME_WM=/org/gnome/desktop/wm/keybindings
KEYS_GNOME_SHELL=/org/gnome/shell/keybindings
KEYS_MUTTER=/org/gnome/mutter/keybindings
KEYS_MEDIA=/org/gnome/settings-daemon/plugins/media-keys
KEYS_POP=/org/gnome/shell/extensions/pop-shell

# Disable incompatible shortcuts and conflicting shortcuts
dconf write /org/gnome/mutter/wayland/keybindings/restore-shortcuts "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-1 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-2 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-3 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-4 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-5 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-6 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-7 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-8 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-9 "@as []"
dconf write ${KEYS_GNOME_SHELL}/switch-to-application-10 "@as []"
dconf write ${KEYS_GNOME_SHELL}/open-application-menu "@as []"
dconf write ${KEYS_MEDIA}/rotate-video-lock-static "@as []"
dconf write ${KEYS_MUTTER}/toggle-tiled-left "@as []"
dconf write ${KEYS_MUTTER}/toggle-tiled-right "@as []"
dconf write ${KEYS_GNOME_WM}/minimize "@as []"

###########################
#                         #
# Navigation key bindings #
#                         #
###########################

# Enable switch-to-workspace with <Super>number
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-1 "['<Super>1']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-2 "['<Super>2']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-3 "['<Super>3']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-4 "['<Super>4']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-5 "['<Super>5']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-6 "['<Super>6']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-7 "['<Super>7']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-8 "['<Super>8']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-9 "['<Super>9']"
dconf write ${KEYS_GNOME_SHELL}/switch-to-workspace-10 "['<Super>0']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-1 "['<Super>1']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-2 "['<Super>2']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-3 "['<Super>3']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-4 "['<Super>4']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-5 "['<Super>5']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-6 "['<Super>6']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-7 "['<Super>7']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-8 "['<Super>8']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-9 "['<Super>9']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-10 "['<Super>0']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-1 "['<Super><Shift>1']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-2 "['<Super><Shift>2']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-3 "['<Super><Shift>3']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-4 "['<Super><Shift>4']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-5 "['<Super><Shift>5']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-6 "['<Super><Shift>6']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-7 "['<Super><Shift>7']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-8 "['<Super><Shift>8']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-9 "['<Super><Shift>9']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-10 "['<Super><Shift>0']"

# Switch between workspaces
# Note these will only work with the horizontal workspaces extension
# dconf write ${KEYS_GNOME_WM}/switch-to-workspace-left "['<Shift><Super>Tab']"
# dconf write ${KEYS_GNOME_WM}/switch-to-workspace-right "['<Super>Tab']"
# Move windows between workspaces
dconf write ${KEYS_GNOME_WM}/move-to-workspace-left "['<Shift><Super>Left','<Shift><Super>${left}']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-right "['<Shift><Super>Right','<Shift><Super>${right}']"
# Move between monitors
dconf write ${KEYS_GNOME_WM}/move-to-monitor-left "['<Alt><Super>Left','<Alt><Super>${left}']"
dconf write ${KEYS_GNOME_WM}/move-to-monitor-right "['<Alt><Super>Right','<Alt><Super>${right}']"

######################################
#                                    #
# Change Pop!_shell default bindings #
#                                    #
######################################

# Toggle maximization state
dconf write ${KEYS_GNOME_WM}/toggle-maximized "['<Super>f']"
# Toggle floating window
dconf write ${KEYS_POP}/toggle-floating "['<Shift><Super>f']"

####################################
# Tile Adjustment mode keybindings #
#
# Enter/Exit tile adjustment mode
dconf write ${KEYS_POP}/tile-enter "['<Super>r']"
dconf write ${KEYS_POP}/tile-accept "['Return']"
dconf write ${KEYS_POP}/tile-reject "['Escape']"
# Move tiles
dconf write ${KEYS_POP}/tile-move-left "['<Shift>Left', '<Shift>${left}']"
dconf write ${KEYS_POP}/tile-move-right "['<Shift>Right', '<Shift>${right}']"
dconf write ${KEYS_POP}/tile-move-up "['<Shift>Up', '<Shift>${up}']"
dconf write ${KEYS_POP}/tile-move-down "['<Shift>Down', '<Shift>${down}']"
# Resize Tiles
dconf write ${KEYS_POP}/tile-resize-left "['Left', '${left}']"
dconf write ${KEYS_POP}/tile-resize-right "['Right', '${right}']"
dconf write ${KEYS_POP}/tile-resize-up "['Up', '${up}']"
dconf write ${KEYS_POP}/tile-resize-down "['Down', '${down}']"
# Select tiles
dconf write ${KEYS_POP}/tile-swap-left "['<Primary>Left', '<Primary>${left}']"
dconf write ${KEYS_POP}/tile-swap-right "['<Primary>Right', '<Primary>${right}']"
dconf write ${KEYS_POP}/tile-swap-up "['<Primary>Up', '<Primary>${up}']"
dconf write ${KEYS_POP}/tile-swap-down "['<Primary>Down', '<Primary>${down}']"
#
#  end of tile adjustment mode bindings #
#########################################

dconf write ${KEYS_POP}/show-title "false"

# Various bindings and launchers
# Lock screen
dconf write ${KEYS_MEDIA}/screensaver "['<Super>Escape']"
# Open Files
dconf write ${KEYS_MEDIA}/home "['<Shift><Super>n']"
# Launch email client
dconf write ${KEYS_MEDIA}/email "['<Super>e']"
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
# Launch web browser
dconf write ${KEYS_MEDIA}/www "['<Shift><Super>Return']"
# Close Window
dconf write ${KEYS_GNOME_WM}/close "['<Super>c']"

dconf write ${KEYS_POP}/activate-launcher "['<Super>slash', '<Super>Space']"

# personal
# Set the keybindings for GNOME
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom12/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom13/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom14/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom15/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom16/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom17/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom18/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom19/' \
  ]"

# Set the keybinding commands
gsettings set org.gnome.desktop.default-applications.terminal exec 'wezterm'

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>Return'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'wezterm'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Lanzar Terminal'"

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Super>o'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'firefox'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'browser'"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Increase Volume'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'pactl set-sink-volume @DEFAULT_SINK@ +05%'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Mod4>n'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Decrease Volume'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'pactl set-sink-volume @DEFAULT_SINK@ -05%'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Mod4><Shift>n'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Toggle Source Mute'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Mod4>m'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Toggle Sink Mute'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Mod4><Shift>m'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Open PulseAudio Volume Control'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'pavucontrol'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Mod4>p'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Open Helvum'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'helvum'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Mod4><Shift>p'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'Push to Talk'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins
