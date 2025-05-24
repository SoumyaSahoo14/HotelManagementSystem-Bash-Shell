#!/bin/bash

echo "===== 📊 Hotel Dashboard Summary ====="

# Total rooms
total_rooms=$(wc -l < rooms.csv)
total_rooms=$((total_rooms - 1))

# Occupied rooms
occupied_rooms=$(awk -F, '$3=="Occupied"' rooms.csv | wc -l)

# Available rooms
available_rooms=$(awk -F, '$3=="Available"' rooms.csv | wc -l)

# Total guests checked in
total_guests=$(wc -l < guests.csv)
total_guests=$((total_guests))

# Total revenue
if [ -f revenue.csv ]; then
    total_revenue=$(awk '{sum+=$1} END {print sum}' revenue.csv)
else
    total_revenue=0
fi

# Output
echo "🏨 Total Rooms: $total_rooms"
echo "✅ Occupied Rooms: $occupied_rooms"
echo "🟢 Available Rooms: $available_rooms"
echo "👥 Total Guests Checked In: $total_guests"
echo "💰 Total Revenue Collected: ₹$total_revenue"
