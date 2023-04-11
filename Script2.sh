#!/bin/bash

# Get root partition usage percentage
usage=$(df -h / | awk 'NR==2{print $5}' | cut -d'%' -f1)

# Check if usage is 20% or more
if [ $usage -ge 20 ]; then
  # Send email alert
  echo "Warning: Root partition usage is $usage%." | mail -s "Root partition usage alert" admin@example.com
  
  # Send SMS alert using Twilio
  account_sid=<your Twilio account SID>
  auth_token=<your Twilio auth token>
  from_number=<your Twilio phone number>
  to_number=<admin's phone number>
  message="Warning: Root partition usage is $usage%."
  curl -X POST https://api.twilio.com/2010-04-01/Accounts/$account_sid/Messages.json \
    --data-urlencode "From=$from_number" \
    --data-urlencode "To=$to_number" \
    --data-urlencode "Body=$message" \
    -u "$account_sid:$auth_token"
fi
