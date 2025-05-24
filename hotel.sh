#!/bin/bash

# Login first
./login.sh
if [[ $? -ne 0 ]]; then
    echo "Login failed. Exiting..."
    exit 1
fi

# Load the stored role
role=$(cat .user_role)

# Direct to role-based menu
case "$role" in
    admin)
        ./admin_menu.sh
        ;;
    reception)
        ./reception_menu.sh
        ;;
    *)
        echo "Unknown role. Access denied."
        exit 1
        ;;
esac

while true
do
clear
echo "===================================="
echo " Hotel Management System"
echo "===================================="
echo "1. View Available Rooms"
echo "2. Book a Room"
echo "3. Guest Check-In"
echo "4. Guest Check-Out"
echo "5. View All Guest Records"
echo "6. Search Guest"
echo "7. View Booked Guest List"
echo "8. Exit"
echo "===================================="
echo -n "Enter your choice [1-8]: "
read choice
case $choice in
    1) bash availability.sh ;;
    2) bash book_room.sh ;;
    3) bash checkin.sh ;;
    4) bash checkout.sh ;;
    5) bash view_guests.sh ;;
    6) bash search_guest.sh ;;
    7) bash view_booked_guests.sh ;;
    8) echo "Thank you! Exiting..."; exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
esac

echo ""
echo "Press Enter to return to the main menu..."
read
done