#!/bin/bash

clear
echo "===================================="
echo " All Guest Records"
echo "===================================="
if [[ ! -f guests.csv ]]; then
    echo "Error: guests.csv not found!"
    exit 1
fi

line_count=$(wc -l < guests.csv)

if [[ $line_count -eq 0 ]]; then
    echo "No guests currently recorded."
    exit 0
fi

column -t -s ',' guests.csv

echo "===================================="