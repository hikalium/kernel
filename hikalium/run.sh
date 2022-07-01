#!/bin/bash -xe
VMLINUX=`readlink -f build/HEAD/vmlinux`
cd ../../crosvm
cargo run -- run ${VMLINUX}

