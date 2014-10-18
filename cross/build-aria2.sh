#!/bin/sh

# This script downloads and builds a static aria2 binary for raspberry pi.

# Copyright 2014 Youjie Zhou <jmpopush@gmail.com>
# All rights reserved.

CWD=$(pwd)
ARCH=$(uname -m)
NJOB=4

# Local folder where we install built binaries and libraries.
LOCAL_DIR=$(readlink -f ./local)
mkdir -p ${LOCAL_DIR}

# Cross-compiler tools.
TOOL_DIR=$(readlink -f ./tools)
TOOL_BIN_DIR=${TOOL_DIR}/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin
TOOL_CC=${TOOL_BIN_DIR}/arm-bcm2708-linux-gnueabi-gcc
TOOL_CXX=${TOOL_BIN_DIR}/arm-bcm2708-linux-gnueabi-g++

PATH=${TOOL_BIN_DIR}:$PATH

# zlib
rm -rf  zlib*
wget http://zlib.net/zlib-1.2.8.tar.gz ./
tar xzf zlib*.tar.gz
cd zlib*/
prefix=${LOCAL_DIR} CC=${TOOL_CC} CFLAGS="-O4" ./configure --static
make -j${NJOB}
make install

cd ${CWD}

# expat
rm -rf expat*
wget http://downloads.sourceforge.net/expat/2.1.0/expat-2.1.0.tar.gz ./
tar xzf expat*.tar.gz
cd expat*/
./configure \
    --host=arm-bcm2708-linux-gnueabi \
    --build=${ARCH}-slackware-linux \
    --enable-shared=no \
    --enable-static=yes \
    --prefix=${LOCAL_DIR}
make -j${NJOB}
make install

cd ${CWD}

# c-ares
rm -rf c-ares*
wget http://c-ares.haxx.se/download/c-ares-1.10.0.tar.gz ./
tar xzf c-ares*.tar.gz
cd c-ares*/
./configure \
    --host=arm-bcm2708-linux-gnueabi \
    --build=${ARCH}-slackware-linux \
    --enable-shared=no \
    --enable-static=yes \
    --prefix=${LOCAL_DIR}
make -j${NJOB}
make install

cd ${CWD}

# aria2
rm -rf aria2*
wget http://downloads.sourceforge.net/aria2/aria2-1.18.8.tar.xz ./
tar xJf aria2*.tar.xz
cd aria2*/
./configure \
    --host=arm-bcm2708-linux-gnueabi \
    --build=${ARCH}-slackware-linux \
    --disable-nls \
    --disable-ssl \
    --disable-epoll \
    --without-gnutls \
    --without-openssl \
    --without-sqlite3 \
    --without-libxml2 \
    --with-libz --with-libz-prefix=${LOCAL_DIR} \
    --with-libexpat --with-libexpat-prefix=${LOCAL_DIR} \
    --with-libcares --with-libcares-prefix=${LOCAL_DIR} \
    --prefix=${LOCAL_DIR} \
    CXXFLAGS="-Os -g" \
    CFLAGS="-Os -g" \
    LDFLAGS="-L${LOCAL_DIR}/lib" \
    PKG_CONFIG_LIBDIR="${LOCAL_DIR}/lib/pkgconfig" \
    ARIA2_STATIC=yes
make -j${NJOB}
make install
