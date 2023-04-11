#!/bin/bash

# Loop to create 10 users
for i in {1..10}
do
  username=user$i
  
  # Create user with password and force change at first login
  useradd -p $(openssl rand -base64 12) -f 0 -e 2023-03-11 -M -N -s /bin/bash -c "Test User $i" $username
  
  # Print out the username and password for reference
  echo "Username: $username"
  echo "Password: $(grep $username /etc/shadow | cut -d: -f2)"
done
