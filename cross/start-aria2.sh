#!/bin/sh
CWD=$(pwd)
${CWD}/aria2c --enable-rpc --rpc-listen-all 2>&1 > /dev/null &
