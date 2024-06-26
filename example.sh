#!/bin/bash

# Example script on how to actually build a sysext using rpm2sysext
RPM2SYSEXT=$(realpath $(dirname $0)/rpm2sysext)

SYSEXTDIR=$(realpath $(dirname $0)/sysext)

rm -rf $SYSEXTDIR
mkdir -p $SYSEXTDIR
pushd $SYSEXTDIR
dnf download uutils-coreutils-replace.x86_64 uutils-coreutils-util-linux-replace.x86_64

export SYSEXT_NAME="uutils"

$RPM2SYSEXT ./*.rpm

popd