echo "===================================="
echo " Guest Check-In "
echo "===================================="

echo "Enter Guest ID:"
read guest_id

if grep -q "^$guest_id," guests.csv; then
    echo "❌ Guest ID already checked in. Please use a different ID."
    exit 1
fi

booked_room=$(awk -F, -v gid="$guest_id" '$2 == gid {print $1}' booked_guests.csv)

if [ -n "$booked_room" ]; then
    echo "📌 Booking found for Guest ID $guest_id: Room $booked_room"
    room_choice="$booked_room"
else
    echo "❌ No booking found for Guest ID: $guest_id"
    echo "Available rooms:"
    available_rooms=$(awk -F, '$3 == "Available" {print $1}' rooms.csv)

    if [[ -z "$available_rooms" ]]; then
        echo "❌ No rooms available."
        exit 1
    fi

    echo "$available_rooms"
    echo "Enter room number to assign:"
    read room_choice

    if grep -q "^$room_choice," guests.csv; then
        echo "❌ This room is already assigned."
        exit 1
    fi
fi

read -p "Enter Guest Name: " name
read -p "Enter Age: " age
read -p "Enter Gender: " gender
read -p "Enter Address: " address

awk -F, -v rn="$room_choice" -v OFS=',' '
NR==1 { print; next }
$1==rn { $3="Occupied" }
{ print }
' rooms.csv > temp.csv && mv temp.csv rooms.csv

echo "$guest_id,$name,$Age,$gender,$address,$room_choice,$check_in_date,$check_out_date,$status" >> guests.csv
echo "✅ Guest $name checked into Room $room_choice successfully."
