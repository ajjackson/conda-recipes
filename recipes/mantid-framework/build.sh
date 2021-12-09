#!/usr/bin/env bash
set -ex

mkdir build
cd build

cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DHDF5_ROOT=$PREFIX \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DENABLE_DOCS=OFF \
  -DUSE_SYSTEM_EIGEN=ON \
  -DWORKBENCH_SITE_PACKAGES=$SP_DIR \
  -DCMAKE_OSX_SYSROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX$OSX_VERSION.sdk" \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DCONDA_ENV=True \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -DMANTID_FRAMEWORK_LIB=BUILD \
  -DMANTID_QT_LIB=OFF \
  -DENABLE_WORKBENCH=OFF \
  -GNinja \
  ../

ninja
ninja install
