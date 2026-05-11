#!/bin/bash

set -e

mkdir -p _deps/lib
ln -s ${PREFIX}/lib/libchealpix.a _deps/lib/libchealpix.a

# try an updated config.*
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
  cp $BUILD_PREFIX/share/gnuconfig/config.* .
fi

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
