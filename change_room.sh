#!/bin/bash

echo "Enter Guest ID for room change:"
read guest_id

# Find guest
guest_record=$(grep "^$guest_id," guests.csv)
if [[ -z "$guest_record" ]]; then
    echo "❌ Guest ID not found or already checked out."
    exit 1
fi

# Extract current room
current_room=$(echo "$guest_record" | cut -d',' -f6)

echo "✅ Current room: $current_room"
echo "----------------------------------"
echo "🟢 Available rooms:"

# Safe fallback to show available rooms using grep + cut
available_rooms=$(grep ",available" rooms.csv | cut -d',' -f1)

if [[ -z "$available_rooms" ]]; then
    echo "⚠️ No available rooms at the moment."
    exit 1
else
    echo "$available_rooms"
fi
echo "----------------------------------"

# Ask for new room
echo "Enter new room number to assign:"
read new_room

# Validate new room
if ! grep -q "^$new_room,available" rooms.csv; then
    echo "❌ Room $new_room is not available."
    exit 1
fi

# Update guest record in guests.csv
updated_record=$(echo "$guest_record" | sed "s/,$current_room,/,${new_room},/")
grep -v "^$guest_id," guests.csv > temp.csv
echo "$updated_record" >> temp.csv
mv temp.csv guests.csv

# Update rooms.csv
sed -i "s/^$current_room,booked/$current_room,available/" rooms.csv
sed -i "s/^$new_room,available/$new_room,booked/" rooms.csv

# Log room change
./log_history.sh "$guest_id" "room_change" "From $current_room to $new_room"

echo "✅ Room changed successfully for guest $guest_id."
echo "ℹ️  $current_room ➡️  $new_room"
