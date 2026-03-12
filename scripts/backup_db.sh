#!/bin/bash

DATE=$(date +%F)

mysqldump --no-tablespaces \
-h 172.31.23.225 \
-u webuser \
-pStrongPassword123! \
webappdb > ~/db_backups/webappdb-$DATE.sql

echo "Backup completed: webappdb-$DATE.sql"

