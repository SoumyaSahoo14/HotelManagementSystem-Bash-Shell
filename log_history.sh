guest_id="$1"
action="$2"
details="$3"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

guest_name=$(grep "^$guest_id," guests.csv | cut -d',' -f2)

echo "$guest_id,$guest_name,$action,$details,$timestamp" >> history.csv
