#!/bin/bash
#
# Build script for libretro core on RPi.

source ../../setup.bash

platform=unix CC=${CROSS_CC} CXX=${CROSS_CXX} LD=${CROSS_LD} AR=${CROSS_AR} make "$@"
