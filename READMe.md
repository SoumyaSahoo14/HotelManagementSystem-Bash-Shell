# Hotel Management System (Shell Script)

A command-line-based hotel management system developed using Bash shell scripting. It helps manage room bookings, guest check-ins, check-outs, and view or search guest information. All data is stored and updated in structured CSV files, making it easy to modify or export.

---
## 👥Contributors
- Soumya Jeet Sahoo
- Abhishek Acharya
## 📂 Project Structure

| File Name               | Description                                    |
| ----------------------- | ---------------------------------------------- |
| hotel.sh                | Main controller script with interactive menu   |
| admin_menu.sh           | Admin login with interactive options           |
| reception_menu.sh       | Reception login with different options         |
| availability.sh         | Displays all rooms with current status         |
| book\_room.sh           | Books a selected room by marking it as Booked  |
| checkin.sh              | Records guest check-in and marks room Occupied |
| checkout.sh             | Removes guest and sets room to Available       |
| view\_guests.sh         | Lists all guests in the system                 |
| search\_guest.sh        | Searches guest by name or room number          |
| view\_booked\_guests.sh | Shows only guests who are currently checked in |
| bill.csv                | Shows bills collected during checkout          |
| revenue.csv             | Shows total revenues collected                 |
| rooms.csv               | Stores room details and their status           |
| guests.csv              | Stores guest details and check-in records      |

---

## 🧰 Features

*  Admin and Receptionist Login
* 📌 View all room availability (Available, Booked, Occupied)
* 🍯 Book rooms by guest id generated 
* 🢍 Guest check-in with auto-date and contact info
* 🧾 Guest check-out with auto-update
* 🔍 Search guest by name or room number
*  Revenue Tracking
* 📋 View all guests or only currently checked-in guests
* 📁 Data stored in editable .csv files (Excel-compatible)

---



## ⚙️ How to Run

1. Open Git Bash or terminal in your project directory.

2. Grant execute permissions to all `.sh` files:

   chmod +x \*.sh

3. Run the main script:

   ./hotel.sh

4. Use the numbered menu to perform operations.

---

## 💠 Technologies Used

* Bash Shell Scripting
* awk, grep, sed, column (Unix commands)
* CSV files for lightweight data storage

---

## 🔒 Future Enhancements (Optional)

* Add GUI using Zenity
* Connect to SQLite for persistent storage
* Add billing and invoice generation
* Multi-user support and logging

---

## 👩‍💼 Developed By

* Soumya Jeet Sahoo & Abhishek Acharya
* IT Infrastructure Management
