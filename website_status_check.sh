#!/bin/bash
# Usage
# Replace the website domain name and the email address in the script.
# Create a cron job to run the script periodically to check the status of your website.
# If the site is not accesible, you will receive notifiaction via email. 

WEBSITE="domain.com"
EMAIL="username@domain.com"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" https://$WEBSITE)
if [ $STATUS -ne "200" ]
   then
   mail -s "$WEBSITE is down!!!" $EMAIL <<< "Your website is down!!!"
fi

