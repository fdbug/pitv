#!/bin/bash
#
# Build script for libretro core on RPi.

source ../../setup.bash

CFLAGS="-I${FIRMWARE_DIR}/opt/vc/include -I${FIRMWARE_DIR}/opt/vc/include/interface/vcos/pthreads -I${FIRMWARE_DIR}/opt/vc/include/interface/vmcs_host/linux -I${OPENELEC_FS_DIR}/usr/include/"

ARM=1 platform=unix CC="${CROSS_CC} ${CFLAGS}" AR=${CROSS_AR} make "$@"
