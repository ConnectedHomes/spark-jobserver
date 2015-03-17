#!/bin/bash
set -e
./package/debian/build_deb.sh $1
exit $?

