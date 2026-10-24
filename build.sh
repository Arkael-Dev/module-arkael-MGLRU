#!/bin/sh
cd "$(dirname "$0")" || exit 1
mkdir -p dist
V=$(grep '^version=' module.prop | cut -d= -f2)
rm -f "dist/Arkael-Mglru-$V.zip"
zip -r -X "dist/Arkael-Mglru-$V.zip" module.prop config.conf customize.sh service.sh ram_tune.sh META-INF webroot
