#!/bin/bash

set -e

mkdir -p _deps/lib
ln -s ${PREFIX}/lib/libchealpix.a _deps/lib/libchealpix.a

${PYTHON} -m pip install . -vv --no-deps
