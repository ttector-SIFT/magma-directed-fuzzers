#!/bin/bash

set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

if [ ! -d "$FUZZER/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

pushd $FUZZER/repo
pushd ./Fish++
  NO_NYX=1 make source-only && chmod +x scripts/*.p
popd

  # compile afl_driver.cpp
  ./Fish++/afl-clang-fast++" $CXXFLAGS -std=c++11 -c "afl_driver.cpp" -fPIC -o "$OUT/afl_driver.o"
popd

