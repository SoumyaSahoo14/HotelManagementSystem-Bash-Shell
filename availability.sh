clear
echo "===================================="
echo " Room Availability"
echo "===================================="
if [[ ! -f rooms.csv ]]; then
echo "Error: rooms.csv file not found!"
exit 1
fi
echo "Room Number | Room Type | Status"
echo "--------------------------------------"
awk -F, 'NR > 1 { printf "%-11s | %-9s | %-10s\n", $1, $2, $3 }' rooms.csv
echo "--------------------------------------"