#!/bin/bash -ex

cd /citra

mkdir build && cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=/usr/lib/ccache/gcc -DCMAKE_CXX_COMPILER=/usr/lib/ccache/g++ -DENABLE_QT_TRANSLATION=ON -DCITRA_ENABLE_COMPATIBILITY_REPORTING=${ENABLE_COMPATIBILITY_REPORTING:-"OFF"} -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON -DUSE_DISCORD_PRESENCE=ON -DENABLE_FFMPEG=ON
ninja

ctest -VV -C Release
