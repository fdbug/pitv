#!/bin/bash
#
# Build script for RetroArch on RPi.

source ../../setup.bash

export CFLAGS="-I${FIRMWARE_DIR}/opt/vc/include -I${FIRMWARE_DIR}/opt/vc/include/interface/vcos/pthreads -I${FIRMWARE_DIR}/opt/vc/include/interface/vmcs_host/linux -I${OPENELEC_FS_DIR}/usr/include/"
export CXXFLAGS=${CROSS_CFLAGS}

# Copy shared libraries from OpenELEC file system.
OPENELEC_LIBS="${OPENELEC_FS_DIR}/lib/libc.so.6 ${OPENELEC_FS_DIR}/lib/libdl.so.2 ${OPENELEC_FS_DIR}/lib/ld-linux-armhf.so.3 ${OPENELEC_FS_DIR}/lib/libpthread-2.22.so ${OPENELEC_FS_DIR}/usr/lib/libasound.so.2.0.0 ${OPENELEC_FS_DIR}/lib/libudev.so.1.6.2 ${OPENELEC_FS_DIR}/usr/lib/libz.so.1.2.8"

# Copy RPi firmware files.
FIRMWARE_LIBS="${FIRMWARE_DIR}/opt/vc/lib/libbcm_host.so ${FIRMWARE_DIR}/opt/vc/lib/libvchiq_arm.so ${FIRMWARE_DIR}/opt/vc/lib/libvcos.so"

export LDFLAGS="-L${FIRMWARE_DIR}/hardfp/opt/vc/lib -L${OPENELEC_FS_DIR}/lib -L${OPENELEC_FS_DIR}/usr/lib ${OPENELEC_LIBS} ${FIRMWARE_LIBS}"

# udev: will be enabled since we provide headers and libs

# alsa: need to manually set HAVE_ALSA=yes in config.lib.sh

# zlib: need to manually set HAVE_ZLIB=yes in config.lib.sh and set WANT_ZLIB=1
# in config.mk.

./configure \
    --prefix=${LOCAL_DIR} \
    --host=${CROSS_PREFIX} \
    --disable-neon \
    --disable-glui \
    --disable-sdl \
    --disable-sdl2 \
    --disable-ffmpeg \
    --disable-networking \
    --disable-netplay \
    --disable-d3d9 \
    --disable-opengl \
    --disable-x11 \
    --disable-libxml2 \
    --disable-oss \
    --disable-rsound \
    --disable-roar \
    --disable-al \
    --disable-jack \
    --disable-coreaudio \
    --disable-pulse \
    --disable-freetype \
    --disable-stb_font \
    --disable-xvideo \
    --disable-python \
    --disable-v4l2 \
    --disable-7zip \
    --disable-zlib \
    --enable-dynamic \
    --enable-dylib \
    --disable-egl \
    --disable-gles \
    --disable-vg \
    --enable-dispmanx \
    --enable-floathard
