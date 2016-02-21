#!/bin/sh
################################################################################
# compile.sh
#
# Part of Project Thrill - http://project-thrill.org
#
# Copyright (C) 2016 Timo Bingmann <tb@panthema.net>
#
# All rights reserved. Published under the BSD-2 license in the LICENSE file.
################################################################################

set -e

git submodule init
git submodule update

CMAKE_OPTS=

# try to find a modern C++ compiler
for CMD in g++-5 g++-5.3.0 g++-5.2.0 g++-5.1.0 g++-4.9 g++-4.9.3; do
    if command -v "$CMD" > /dev/null; then
        CMAKE_OPTS="$CMAKE_OPTS -DCMAKE_CXX_COMPILER=$CMD"
        break
    fi
done

# detect number of cores
CORES=$(grep -c ^processor /proc/cpuinfo)
MAKEOPTS=-j$CORES

if [ ! -d "build" ]; then
    mkdir build
fi
cd build
cmake .. $CMAKE_OPTS $@
make $MAKEOPTS
ctest -V

################################################################################
