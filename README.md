#!/bin/bash

DATE=$(date +%F)

mysqldump --no-tablespaces \
-h DB_SERVER_IP \
-u webuser \
-pPASSWORD \
webappdb > ~/db_backups/webappdb-$DATE.sql

echo "Backup completed: webappdb-$DATE.sql"

