#!/bin/bash

while true; do
    echo ""
    echo "===== ADMIN MENU ====="
    echo "1. View all guests"
    echo "2. View all bills"
    echo "3. View guest history"
    echo "4. View revenue"
    echo "5. View dashboard summary"
    echo "6. Export reports"
    echo "7. Print reports"
    echo "8. Change room"
    echo "9. Logout" 
    echo "======================="
    read -p "Choose an option: " choice

    case "$choice" in
        1) ./view_guests.sh ;;
        2) cat bills.csv ;;
        3)
            echo "----- Guest History Log -----"
            echo "GuestID | Name | Action | Detail | Timestamp"
            echo "---------------------------------------------"
            awk -F',' '{
                printf "%s | %s | %s | %s | %s\n", $1, $2, $3, $4, $5
            }' history.csv
            echo "---------------------------------------------"
            ;;
        4) 
            echo "----- Revenue Report -----"
            echo "Total Revenue: ₹$(awk '{s+=$1} END {print s}' revenue.csv)"
            echo "---------------------------------------------"
            ;;
        5) 
            echo "----- Dashboard Summary -----"
            echo "Total Revenue: ₹$(awk '{s+=$1} END {print s}' revenue.csv)"
            echo "Total Guests Checked In: $(wc -l < guests.csv)"
            echo "Total Rooms Available: $(grep -c 'Available' rooms.csv)"
            echo "Total Rooms Booked: $(grep -c 'Booked' rooms.csv)"
            echo "---------------------------------------------"
            ;;
        6) echo "Exporting reports..."
            echo "Exporting guest history..."
            cp history.csv "history_$(date +%Y%m%d).csv"
            echo "Exporting revenue report..."
            cp revenue.csv "revenue_$(date +%Y%m%d).csv"
            echo "Exporting guest list..."
            cp guests.csv "guests_$(date +%Y%m%d).csv"
            echo "Exporting booked guests..."
            cp booked_guests.csv "booked_guests_$(date +%Y%m%d).csv"
            echo "Exporting all guests..."
            cp all_guests.csv "all_guests_$(date +%Y%m%d).csv"
            echo "Reports exported successfully."
            ;;
        7) echo "Printing reports..."
            echo "Printing guest history..."
            column -s, -t < history.csv | less
            echo "Printing revenue report..."
            column -s, -t < revenue.csv | less
            echo "Printing guest list..."
            column -s, -t < guests.csv | less
            echo "Printing booked guests..."
            column -s, -t < booked_guests.csv | less
            echo "Printing all guests..."
            column -s, -t < all_guests.csv | less
            ;; 
        8) ./change_room.sh ;; 
        9) echo "Logging out..."
            exit 0
            ;;
        *) echo "Invalid choice" ;;
    esac
done


