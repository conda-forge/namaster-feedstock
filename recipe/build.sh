#!/bin/bash

set -e

#if [[ `uname` == 'Darwin' ]]; then
#    LIBS="-lomp"
#else
#    LIBS="-lgomp"
#fi
#./configure --prefix=${PREFIX} LIBS="${LIBS}"
#make
#make install

mkdir -p _deps/lib
ln -s ${PREFIX}/lib/libchealpix.a _deps/lib/libchealpix.a

${PYTHON} -m pip install . -vv --no-deps

# run tests now since they are not around later
make check
