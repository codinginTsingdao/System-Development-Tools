#!/bin/bash

find ~ -type f |
awk -F. '
NF>1{
    ext=$NF
    count[ext]++
}
END{
    for(i in count)
        print count[i],i
}' |
sort -nr |
head -5
