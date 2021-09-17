#!/bin/bash
set -e
rootdir="$PWD"
cd ..
mkdir -p mcpe
cd mcpe
wget -O mcpe11711r1.7z "https://www.dropbox.com/s/kimrzpu9eyd0yk3/mcpe11711r1.7z?dl=1"
wget -O mcpe190b3_x86.7z "https://www.dropbox.com/s/dxce7fhzbrv05gy/mcpe190b3_x86.7z?dl=1"
wget -O mcpe180.7z "https://www.dropbox.com/s/1uu4qhdn7tpiwvp/mcpe180.7z?dl=1"
# sha256sum -c "$rootdir/tools/ci/mc_archives_sha256sum.txt"

7z -aoa x mcpe11711r1.7z
7z -aoa x mcpe190b3_x86.7z
7z -aoa x mcpe180.7z
# sha256sum -c "$rootdir/tools/ci/mc_sha256sum.txt"

rm -r 1141 190b3_x86 || true
7z -o1141 x mcpe11711r1.apk
# 180b3_x86: only used for linking against its libs
7z -o190b3_x86 x mcpe190b3_x86.apk lib
# 180: only used for xbox interop
