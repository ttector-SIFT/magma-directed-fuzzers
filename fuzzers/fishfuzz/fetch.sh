#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/HexHive/FishFuzz.git
cp -r ./FishFuzz/FF_AFL++/* $FUZZER/repo
rm -r ./FishFuzz
cp "$FUZZER/src/afl_driver.cpp" "$FUZZER/repo/afl_driver.cpp"
