#!/bin/bash

echo "===== 🛏️ Book a Room ====="
read -p "Enter Guest Name: " guest_name

# Generate Guest ID
prefix=$(tr -dc 'A-Z' </dev/urandom | head -c1)
number=$(( ( RANDOM % 90 ) + 10 ))
guest_id="${prefix}${number}"
echo "Generated Guest ID: $guest_id"

# Display available rooms
# ...existing code...
echo -e "\n🏨 Available Rooms:"
echo -e "RoomNo     Type           Status"
awk -F, 'tolower($3) ~ /available/ { printf "%-10s %-15s %-10s\n", $1, $2, $3 }' rooms.csv
# ...existing code...

read -p "Enter Room Number to Book: " room_no

# Validate room
if grep -q "^$room_no,.*Available" rooms.csv; then
    # Update room status
    sed -i "s/^$room_no,\(.*\),Available/$room_no,\1,Booked/" rooms.csv

    # Save booking info
    echo "$room_no,$guest_id,$guest_name" >> booked_guests.csv
    echo "$guest_id,$guest_name,Pre-booked for Room $room_no" >> all_guests.csv

    echo "✅ Room $room_no booked for $guest_name (ID: $guest_id)."
else
    echo "❌ Room $room_no is not available."
    exit 1
fi
