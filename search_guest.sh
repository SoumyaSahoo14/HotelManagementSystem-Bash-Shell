clear
echo "===================================="
echo " Search Guest"
echo "===================================="

if [[ ! -f guests.csv ]]; then
    echo "Error: guests.csv not found!"
    exit 1
fi

echo "Search by:"
echo "1. Guest Name"
echo "2. Room Number"
read -p "Enter option [1-2]: " choice

case $choice in
1)
    read -p "Enter Guest Name to search: " name
    echo "Results:"
    awk -F, -v name="$name" 'BEGIN{IGNORECASE=1} NR==1 || tolower($2) ~ tolower(name)' guests.csv | column -t -s ','
    ;;
2)
    read -p "Enter Room Number to search: " room
    echo "Results:"
    awk -F, -v room="$room" 'NR==1 || tolower(gensub(/^[ \t]+|[ \t]+$/, "", "g", $6)) == tolower(room)' guests.csv | column -t -s ','
    ;;
*)
    echo "Invalid choice."
    ;;
esac

echo "===================================="
