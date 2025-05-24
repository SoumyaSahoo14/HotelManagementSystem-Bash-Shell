#!/bin/bash

echo -n "Enter username: "
read username

echo -n "Enter password: "
password=""
while IFS= read -r -s -n1 char; do
    if [[ $char == $'\0' || $char == $'\n' ]]; then
        break
    fi
    if [[ $char == $'\177' ]]; then  # handle backspace
        password="${password%?}"
        echo -ne "\b \b"
    else
        password+="$char"
        echo -n "*"
    fi
done
echo

found=0

while IFS=',' read -r u p role; do
    if [[ "$username" == "$u" && "$password" == "$p" ]]; then
        echo "Login successful as $role"
        echo "$role" > .user_role
        found=1
        break
    fi
done < users.csv

if [[ $found -eq 0 ]]; then
    echo "Invalid credentials"
    exit 1
fi
