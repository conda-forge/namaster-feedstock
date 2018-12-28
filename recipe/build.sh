#!/bin/bash

set -e

if [[ `uname` == 'Darwin' ]]; then
    LIBS="-lomp"
    if [[ ${CC} != "clang" ]]; then
        export LDFLAGS="${LDFLAGS//-Wl,-dead_strip_dylibs/}"
        export LDFLAGS_LD="${LDFLAGS_LD//-dead_strip_dylibs/}"
    fi
else
    LIBS="-lgomp"
fi
./configure --prefix=${PREFIX} LIBS="${LIBS}"
make
make install

${PYTHON} -m pip install . -vv --no-deps

# run tests now since they are not around later
make check
