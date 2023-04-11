#!/bin/bash

# Set recipients
recipients="user1@example.com user2@example.com user3@example.com user4@example.com user5@example.com yourname@gmail.com"

# Set email subject and content
subject="reminder"
content="Dear user, please remember to do your assignment in order to develop muscles"

# Send email to recipients
echo "$content" | mail -s "$subject" $recipients
