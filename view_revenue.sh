#!/bin/bash

echo "===== 📊 Total Revenue ====="

if [ ! -f revenue.csv ]; then
    echo "₹0"
else
    total=$(awk '{sum+=$1} END {print sum}' revenue.csv)
    echo "💸 Total Revenue Collected: ₹$total"
fi
