#!/bin/bash
#
# Build script for libretro-fceumm on RPi.

source ../../setup.bash

platform=armv-hardfloat CC=${CROSS_CC} AR=${CROSS_AR} make
