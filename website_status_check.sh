#!/bin/bash

WEBSITE="domain.com"
EMAIL="username@domain.com"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" https://$WEBSITE)
if [ $STATUS -ne "200" ]
   then
   mail -s "$WEBSITE is down!!!" $EMAIL <<< "Your website is down!!!"
fi

