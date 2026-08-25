#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "Error: file not found"
    exit 1
fi

echo "Top 2 paths with 5xx errors:"

awk -F',' '
NR>1 && $3 ~ /^5/ {
    count[$2]++
}
END{
    for(i in count)
        print count[i],i
}' "$file" | sort -nr | head -2

echo "Average latency:"

awk -F',' '
NR>1 {
    sum += $4
    cnt++
}
END{
    printf "%.2f\n",sum/cnt
}' "$file"
