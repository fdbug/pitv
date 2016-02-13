#!/bin/bash

ROOT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

LOCAL_DIR=${ROOT_DIR}/local

TOOL_DIR=$(readlink -f ${ROOT_DIR}/pi/tools/)
FIRMWARE_DIR=$(readlink -f ${ROOT_DIR}/pi/firmware/hardfp)

CROSS_PREFIX=${TOOL_DIR}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf
CROSS_CC=${CROSS_PREFIX}-gcc
CROSS_CXX=${CROSS_PREFIX}-g++
CROSS_LD=${CROSS_PREFIX}-ld
CROSS_AR=${CROSS_PREFIX}-ar

OPENELEC_FS_DIR=${ROOT_DIR}/openelecfs

export CPLUS_INCLUDE_PATH=""
export LD_LIBRARY_PATH=""
export PKG_CONFIG_PATH=${ROOT_DIR}/local/lib/pkgconfig
