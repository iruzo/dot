# ct n | steam
# ct i | steam
# ct w | yes
# ct g | yes
# ct v | ~/Public:/public:z

FROM docker.io/library/archlinux:multilib-devel

RUN pacman -Syyuu steam gamescope xorg-xwayland vulkan-radeon vulkan-intel --noconfirm

RUN printf '%s\n' \
  '#!/bin/sh' \
  'exec gamescope --backend wayland -e -- /usr/bin/steam "$@"' \
  > /usr/local/bin/steam \
  && chmod 755 /usr/local/bin/steam

ENV PATH="/usr/loca/bin:${PATH}"
