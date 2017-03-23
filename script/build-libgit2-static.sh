#!/bin/sh

set -ex

VENDORED_PATH=vendor/libgit2

cd $VENDORED_PATH &&
mkdir -p install/lib &&
mkdir -p build &&
cd build &&
cmake -DTHREADSAFE=ON \
      -DBUILD_CLAR=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=../install \
      -DCMAKE_SYSTEM_NAME=Windows \
      -DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32 \
      -DCMAKE_C_COMPILER=/usr/bin/x86_64-w64-mingw32-gcc \
      -DCMAKE_CXX_COMPILER=/usr/bin/x86_64-w64-mingw32-g++ \
      -DDLLTOOL=/usr/bin/x86_64-w64-mingw32-dlltool \
      -DCGO_LDFLAGS="-lwinhttp -lcrypt32 -lrpcrt4 -lole32 -lmswsock -lwsock32" \
      .. &&

cmake --build .
