#!/bin/bash

echo "========= 📤 Export Reports Menu ========="
echo "1. Export All Guest Records"
echo "2. Export Guest History Log"
echo "3. Export Billing Summary (if exists)"
echo "4. Back to Admin Menu"
echo "=========================================="
read -p "Enter your choice [1-4]: " choice

case $choice in
  1)
    cp guests.csv exported_guests.csv
    echo "✅ Guest records exported to exported_guests.csv"
    ;;
  2)
    cp history.csv exported_guest_history.csv
    echo "✅ Guest history exported to exported_guest_history.csv"
    ;;
  3)
    if [ -f bills.csv ]; then
      cp bills.csv exported_billing_summary.csv
      echo "✅ Billing summary exported to exported_billing_summary.csv"
    else
      echo "⚠️ No billing data found."
    fi
    ;;
  4)
    exit 0
    ;;
  *)
    echo "❌ Invalid choice. Try again."
    ;;
esac
