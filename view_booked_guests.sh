#!/bin/bash

echo "===== 📋 Booked Guest List ====="

if [ ! -s booked_guests.csv ]; then
    echo "❌ No bookings found."
else
    column -t -s, booked_guests.csv | awk 'BEGIN {print "Room\tGuest ID\tName"} {print $1 "\t" $2 "\t" $3}'
fi
~