#!/bin/bash

# Build mold on Intel EC

# Make sure your .itools has at least:
# P:gcc 12.1.0
# P:cmake 3.26.4
# (gcc 12.2.0 in itools doesn't seem to work)

rm -rf build/*
mkdir -p build

pushd build

# The C++ compiler must be >= GCC 12
# The C compiler needs to be >= GCC 4.9 or things will fail to build. cc is the
# default C compiler, and is at 4.8 on EC machines, so set it to gcc
# https://bugzilla.redhat.com/show_bug.cgi?id=1850174
cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_C_COMPILER=gcc \
-DCMAKE_CXX_COMPILER=g++ \
-DCMAKE_INSTALL_PREFIX=$HOME/code/mold/bin \
.. >& cmake.log

cmake --build . -j $(nproc) >& build.log

popd
