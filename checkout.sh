#!/bin/bash

echo "===== 🚪 Guest Checkout ====="
read -p "Enter Guest ID: " guest_id

# Get guest info
guest_line=$(grep "^$guest_id," guests.csv)

if [ -z "$guest_line" ]; then
    echo "❌ Guest ID not found."
    exit 1
fi

room_no=$(echo "$guest_line" | cut -d',' -f6)

# Get room type
room_type=$(awk -F, -v r="$room_no" '$1 == r {print $2}' rooms.csv)

# Set room price
case "$room_type" in
    "Standard") price=1000 ;;
    "Deluxe") price=2000 ;;
    "Luxury") price=3000 ;;
    "PentHouse") price=5000 ;;
    *) price=1500 ;;
esac

# Remove from guests.csv
grep -v "^$guest_id," guests.csv > temp.csv && mv temp.csv guests.csv

# Remove from booked_guests.csv
grep -v "$guest_id" booked_guests.csv > temp.csv && mv temp.csv booked_guests.csv

# Update room status to Available
awk -F, -v rn="$room_no" -v OFS=',' '
NR==1 {print; next}
$1 == rn {$3="Available"}
{print}
' rooms.csv > temp.csv && mv temp.csv rooms.csv

# Save to bills and revenue
echo "$guest_id,$room_no,$room_type,$price" >> bills.csv
echo "$price" >> revenue.csv

echo "✅ Guest $guest_id checked out. Room $room_no is now available."
echo "💰 Bill of ₹$price added to revenue."
echo "📜 Bill generated for Guest ID $guest_id in bills.csv."