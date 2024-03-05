# ct n | wow
# ct i | wow
# ct h | yes
# ct w | yes
# ct g | yes

FROM docker.io/library/alpine:latest

# RUN apk add curl unzip
# COPY wow_3.3.5a.zip wow.zip
# RUN unzip wow.zip
# RUN rm wow.zip
# RUN mv wow_3.3.5a wow

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing wine-staging winetricks
RUN apk add --no-cache mesa mesa-dri-gallium vulkan-loader vulkan-tools mesa-vulkan-intel mesa-vulkan-ati mesa-vulkan-nouveau mesa-vulkan-swrast mesa-vulkan-virtio
RUN winetricks dxvk corefonts # d3dcompiler_47 vcrun2019 dotnet48

# --no-sandbox
ENV ELECTRON_DISABLE_SANDBOX=1

# Electron apps like launchers must be run with these flags
# --disable-gpu

COPY wow.sh /usr/sbin/wow
RUN chmod 755 /usr/sbin/wow
