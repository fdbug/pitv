#!/bin/bash
CWD=$(dirname $(readlink -f "$0"))
if [[ ! -z ${CWD}/aria2.session ]]; then
    touch ${CWD}/aria2.session
fi
${CWD}/aria2c --conf-path=${CWD}/aria2.conf -D
