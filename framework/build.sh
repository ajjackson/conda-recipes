#!/usr/bin/env bash

set -ex

echo "PREFIX: " $PREFIX
echo "CONDA_PREFIX: " $CONDA_PREFIX

mkdir build
cd build

export CXXFLAGS="-stdlib=libc++ -std=c++11"
CXXFLAGS=${CXXFLAGS} cmake \
    -G Ninja \
    -DUSE_SYSTEM_EIGEN=ON \
    -DENABLE_OPENGL=OFF \
    -DENABLE_MANTIDPLOT=FALSE \
    -DENABLE_WORKBENCH=FALSE \
    -DENABLE_OPENCASCADE=FALSE \
    -DPYTHON_EXECUTABLE="${CONDA_PREFIX}/bin/python" \
    -DCMAKE_PREFIX_PATH=${CONDA_PREFIX} \
    -DCMAKE_INSTALL_PATH=${CONDA_PREFIX} \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DBOOST_INCLUDEDIR="${CONDA_PREFIX}/include" \
    ..

cmake --build .
cmake --build . --target install

# move mantid
python_site_pkg_path=`python -c "from __future__ import print_function; import h5py, os; opd=os.path.dirname; print(opd(opd(h5py.__file__)))"`
echo $python_site_pkg_path

mv ${CONDA_PREFIX}/lib/mantid $python_site_pkg_path/
mv ${CONDA_PREFIX}/lib/mantid-*-py*.egg-info $python_site_pkg_path/
