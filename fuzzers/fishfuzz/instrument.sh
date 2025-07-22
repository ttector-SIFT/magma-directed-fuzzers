#!/bin/bash

set -e

export FF_DRIVER_NAME=DIR # this is chosen so that TMP_DIR=TMP_DIR will be passed to afl-fuzz in run.sh
export CC=$FUZZER/repo/ff-all-in-one
export CXX=$FUZZER/repo/ff-all-in-one++
export LIBS="$LIBS -l:afl_driver.o -lstdc++"

pushd $FUZZER/repo
  make -j$(nproc)
popd

"$TARGET/build.sh"
