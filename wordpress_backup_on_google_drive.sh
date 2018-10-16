#!/bin/bash

WPDIR="/var/www/html/wordpress"
DB_NAME="wordpress_db"
DB_USER="wordpress_user"
DB_PASSWORD="PaSsW0rD"
GDDIR="1DyzfPjXNmVpbtZWGGoeg3FxSAYU"
DATE=`date +%Y-%m-%d`
TMPDIR="/tmp/wpbackup-$DATE"

# Create temp directory
mkdir $TMPDIR

# Backup the WordPress files in a zip archive
zip -r $TMPDIR/wpbackup-${DATE}.zip $WPDIR > /dev/null

# Backup the MySQL database
mysqldump -u $DB_USER -p${DB_PASSWORD} $DB_NAME > $TMPDIR/$DB_NAME-$DATE.sql

#Sync the backups to Google Drive
/root/gdrive upload --parent --recursive $GDDIR $TMPDIR

# Remove the temp directory and the stored data
rm -rf $TMPDIR

