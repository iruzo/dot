FROM docker.io/library/alpine:latest base

FROM base as build

WORKDIR /root

RUN apk add curl unzip
COPY wow_3.3.5a.zip wow.zip
RUN unzip wow.zip
RUN rm wow.zip
RUN mv wow_3.3.5a wow

RUN mkdir -p wow/WTF
RUN echo 'SET locale "enUS"' >> wow/WTF/Config.wtf
RUN echo 'SET hwDetect "0"' >> wow/WTF/Config.wtf
RUN echo 'SET gxRefresh "60"' >> wow/WTF/Config.wtf
RUN echo 'SET gxMultisampleQuality "0.000000"' >> wow/WTF/Config.wtf
RUN echo 'SET gxFixLag "0"' >> wow/WTF/Config.wtf
RUN echo 'SET videoOptionsVersion "3"' >> wow/WTF/Config.wtf
RUN echo 'SET movie "0"' >> wow/WTF/Config.wtf
RUN echo 'SET Gamma "1.000000"' >> wow/WTF/Config.wtf
RUN echo 'SET showToolsUI "1"' >> wow/WTF/Config.wtf
RUN echo 'SET Sound_OutputDriverName "System Default"' >> wow/WTF/Config.wtf
RUN echo 'SET Sound_MusicVolume "0.40000000596046"' >> wow/WTF/Config.wtf
RUN echo 'SET Sound_AmbienceVolume "0.60000002384186"' >> wow/WTF/Config.wtf
RUN echo 'SET farclip "727"' >> wow/WTF/Config.wtf
RUN echo 'SET specular "1"' >> wow/WTF/Config.wtf
RUN echo 'SET groundEffectDensity "24"' >> wow/WTF/Config.wtf
RUN echo 'SET projectedTextures "1"' >> wow/WTF/Config.wtf
RUN echo 'SET gxResolution "1920x1080"' >> wow/WTF/Config.wtf
RUN echo 'SET gxWindow "1"' >> wow/WTF/Config.wtf
RUN echo 'SET gxWaximize "1"' >> wow/WTF/Config.wtf
RUN echo 'SET readTOS "1"' >> wow/WTF/Config.wtf
RUN echo 'SET readEULA "1"' >> wow/WTF/Config.wtf
RUN echo 'SET gxMaximize "1"' >> wow/WTF/Config.wtf
# RUN echo 'SET gxApi "OpenGL"' >> wow/WTF/Config.wtf

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
