#!/bin/bash
clear
echo "=============================================="
echo "            🏨 HOTEL MANAGEMENT REPORT         "
echo "=============================================="
echo

# 1) Current Guests
echo "---- Current Checked-In Guests ----"
if [ -s guests.csv ]; then
  column -s, -t guests.csv | sed '1s/^/ID   Name      Age  Gender  Address          Room  Check-in Date\n/' 
else
  echo "(none)"
fi
echo

# 2) Full Guest History
echo "---- Full Guest History Log ----"
if [ -s history.csv ]; then
  column -s, -t history.csv | sed '1s/^/ID  Name        Action        Details                     Timestamp\n/'
else
  echo "(none)"
fi
echo

# 3) Billing Summary
if [ -f bills.csv ]; then
  echo "---- All Bills ----"
  column -s, -t bills.csv | sed '1s/^/BillID  GuestID  Amount  Date\n/'
  echo
  echo "Total Revenue: ₹$(awk -F',' '{sum+=$3} END{print sum}' bills.csv)"
else
  echo "---- No billing data ----"
fi
echo
echo "=============================================="
