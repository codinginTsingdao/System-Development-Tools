#!/bin/bash

mkdir -p input/docs input/tmp

printf "alpha\nbeta\n" > "input/docs/notes one.txt"
printf "hidden\n" > input/docs/.secret.txt
touch input/tmp/empty.txt
printf "log line 1\nlog line 2\n" > input/run.log

mkdir -p work/25090033037

find input -type f -name "*.txt" \
-exec cp --parents {} work/25090033037/ \;

find work/25090033037 -type d -exec chmod 750 {} \;
find work/25090033037 -type f -exec chmod 640 {} \;

find work/25090033037 -type f -printf "%P %s\n" > inventory.txt
