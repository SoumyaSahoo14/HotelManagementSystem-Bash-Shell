clear
echo "===================================="
echo " Billing System"
echo "===================================="
if [[ ! -f guests.csv || ! -f rooms.csv ]]; then
echo "Error: guests.csv or rooms.csv not found!"
exit 1
fi

read -p "Enter Room Number for Billing: " room_no
guest=$(awk -F, -v rn="$room_no" '$6==rn && $7=="Checked-In" { print $1","$2","$3","$4 }' guests.csv)

if [[ -z "$guest" ]]; then
echo "No guest found in Room $room_no or not checked-in."
exit 1
fi

guest_name=$(echo "$guest" | cut -d',' -f1)
phone=$(echo "$guest" | cut -d',' -f2)
gender=$(echo "$guest" | cut -d',' -f3)
address=$(echo "$guest" | cut -d',' -f4)
room_type=$(awk -F, -v rn="$room_no" '$1==rn { print $2 }' rooms.csv)
case "$room_type" in
Single) rate=1000 ;;
Double) rate=1800 ;;
Suite) rate=2500 ;;
Luxury) rate=3500 ;;
PentHouse) rate=5000 ;;
*) rate=1500 ;;
esac

read -p "Enter number of days stayed: " days

total=$(( rate * days ))
echo "$guest_name,$phone,$gender,$address,$room_no,$room_type,$days,$rate,$total" >> bills.csv
echo "===================================="
echo " Hotel Invoice"
echo "Guest Name : $guest_name"
echo "Phone : $phone"
echo "Gender : $gender"
echo "Address : $address"
echo "Room Number : $room_no"
echo "Room Type : $room_type"
echo "Rate/Day : Rs. $rate"
echo "Days Stayed : $days"
echo "Total Amount : Rs. $total"
echo "===================================="