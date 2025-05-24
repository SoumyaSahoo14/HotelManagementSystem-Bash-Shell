#!/bin/bash

echo "===== 💰 Generate Bill ====="
read -p "Enter Guest ID: " guest_id

# Find guest info
guest_info=$(grep "^$guest_id," guests.csv)

if [ -z "$guest_info" ]; then
    echo "❌ Guest ID not found."
    exit 1
fi

room_no=$(echo "$guest_info" | cut -d',' -f6)
room_type=$(awk -F, -v r="$room_no" '$1 == r {print $2}' rooms.csv)

# Price setup (you can customize as needed)
case "$room_type" in
    "Standard") price=1000 ;;
    "Deluxe") price=2000 ;;
    "Luxury") price=3000 ;;
    "PentHouse") price=5000 ;;
    *) price=1500 ;;
esac

# Write bill
bill_file="bills.csv"
echo "$guest_id,$room_no,$room_type,$price" >> "$bill_file"
echo "✅ Bill Generated:"
echo "Guest ID: $guest_id | Room: $room_no | Type: $room_type | Amount: ₹$price"

# Add to revenue
echo "$price" >> revenue.csv
