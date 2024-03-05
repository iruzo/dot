FROM docker.io/library/alpine:latest base

FROM base as build

WORKDIR /root

RUN apk add \
  git \
  scons \
  pkgconf \
  gcc \
  g++ \
  libx11-dev \
  libxcursor-dev \
  libxinerama-dev \
  libxi-dev \
  libxrandr-dev \
  mesa-dev \
  eudev-dev \
  alsa-lib-dev \
  pulseaudio-dev
RUN git clone https://github.com/godotengine/godot
RUN cd godot/ && scons platform=linuxbsd production=yes

FROM base as end

WORKDIR /root

ENV REALMLIST='set realmlist logon.chromiecraft.com'

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing wine-staging winetricks
RUN apk add --no-cache mesa mesa-dri-gallium vulkan-loader vulkan-tools mesa-vulkan-intel mesa-vulkan-ati mesa-vulkan-nouveau mesa-vulkan-swrast mesa-vulkan-virtio
# RUN winetricks d3dcompiler_47 dotnet48 vcrun2019 dxvk
RUN winetricks -q dxvk

COPY --from build /root/wow /root/wow

# CMD ["/bin/sh", "-l"]
ENTRYPOINT ["sh", "-c", "printf '%s\n' \"$REALMLIST\" > /root/wow/Data/enUS/realmlist.wtf && exec wine /root/wow/Wow.exe"]
