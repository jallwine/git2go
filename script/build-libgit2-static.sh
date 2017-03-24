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
      -DCMAKE_C_FLAGS=-fPIC \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=../install \
      -DCMAKE_SYSTEM_NAME=Darwin \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_C_COMPILER=/usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-clang \
      -DCMAKE_CXX_COMPILER=/usr/local/osx-ndk-x86/bin/x86_64-apple-darwin15-clang++ \
      -DCOREFOUNDATION_DIRS=/usr/local/osx-ndk-x86/SDK/MacOSX10.11.sdk/System/Library/Frameworks/CoreFoundation.framework \
      -DSECURITY_DIRS=/usr/local/osx-ndk-x86/SDK/MacOSX10.11.sdk/System/Library/Frameworks/Security.framework \
      .. &&

cmake --build .
