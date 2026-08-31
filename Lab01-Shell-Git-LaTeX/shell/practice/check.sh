#!/bin/bash

if [ -e "$1" ]; then
    echo "文件存在: $1"
    exit 0
else
    echo "文件不存在"
    exit 1
fi
