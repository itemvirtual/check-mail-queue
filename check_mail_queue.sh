#!/bin/bash

# Parse named parameters
while getopts "t:c:m:" opt; do
  case $opt in
    t)
      to=$OPTARG
      ;;
    c)
      cc=$OPTARG
      ;;
    m)
      max_emails=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Check if Postfix is running
if systemctl is-active --quiet postfix; then
    echo "Postfix is running."

    # Count the number of messages in the mail queue that have an ID starting with a number or an uppercase letter
    count=$(mailq | grep -c '^[0-9A-Z]')

    echo "Number of messages in the mail queue: $count"

    # If the count is greater than the maximum number of emails, send an email to the To and CC recipients
    if [ "$count" -gt "$max_emails" ]
    then
        echo "The number of messages in the mail queue is greater than $max_emails. Sending an email to $to and $cc..."
        echo "Subject: Mail Queue Alert" | mail -s "Mail Queue Alert" -c "$cc" "$to" <<< "There are currently $count messages in the mail queue."

        # Stop the mail service
        service postfix stop
    fi
else
    echo "Postfix is not running."
fi