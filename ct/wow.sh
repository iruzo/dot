#!/bin/sh
set -eu

for binary in Wow.exe WoW.exe WoW32.exe; do
  if [ -f "./$binary" ]; then
    mkdir -p WTF
    res="${RESOLUTION:-1920x1080}"
    realmlist="${REALMLIST:-}"
    # Written whole rather than appended so repeated runs do not stack duplicates.
    echo "set realmlist $realmlist" > Data/enUS/realmlist.wtf
    cat > WTF/Config.wtf <<EOF
SET locale "enUS"
SET hwDetect "0"
SET gxRefresh "60"
SET gxMultisampleQuality "0.000000"
SET gxFixLag "0"
SET videoOptionsVersion "3"
SET movie "0"
SET Gamma "1.000000"
SET showToolsUI "1"
SET Sound_OutputDriverName "System Default"
SET Sound_MusicVolume "0.40000000596046"
SET Sound_AmbienceVolume "0.60000002384186"
SET farclip "727"
SET specular "1"
SET groundEffectDensity "24"
SET projectedTextures "1"
SET gxResolution "$res"
SET gxWindow "1"
SET gxWaximize "1"
SET readTOS "1"
SET readEULA "1"
SET gxMaximize "1"
EOF
    exec wine "$binary"
  fi
done

# SET gxApi "OpenGL"

printf 'run_example1: no WoW.exe or WoW32.exe in %s\n' "$PWD" >&2
exit 1
