#!/bin/bash

while true; do
clear
echo "========= Receptionist Menu ========="
echo "1. View Available Rooms"
echo "2. Book a Room"
echo "3. Guest Check-In"
echo "4. Guest Check-Out"
echo "5. View All Guest Records"
echo "6. Search Guest"
echo "7. View Booked Guest List"
echo "8. Exit"
echo "====================================="
read -p "Enter your choice [1-8]: " choice

case $choice in
    1) bash availability.sh ;;
    2) bash book_room.sh ;;
    3) bash checkin.sh ;;
    4) bash checkout.sh ;;
    5) bash view_guests.sh ;;
    6) bash search_guest.sh ;;
    7) bash view_booked_guests.sh ;;
    8) echo "Logging out..."; break ;;
    *) echo "Invalid option. Try again." ;;
esac

echo ""
read -p "Press Enter to return to the menu..."
done
