Linux Multi-Server Administration Project (AWS EC2)
Project Overview

This project demonstrates how to deploy and manage a multi-server Linux infrastructure on AWS EC2.
The environment includes a web server, database server, backup server, and admin server used for management.

The goal of the project is to simulate a real production architecture where a web application communicates with a database and autoimated backups protect critical data.

              Architecture

                Internet
                    │
                    ▼
            +----------------+
            |   app-server   |
            |     Nginx      |
            +----------------+
                    │
                    │ MySQL connection
                    ▼
            +----------------+
            |   db-server    |
            |     MySQL      |
            +----------------+
                    │
                    │ mysqldump backup
                    ▼
            +----------------+
            | backup-server  |
            | Database Backup|
            +----------------+

            +----------------+
            | admin-server   |
            |  Management    |
            +----------------+


            Servers Used
Server	        Purpose
admin-server	Infrastructure management
app-server	    Nginx web server
db-server	    MySQL database
backup-server	Automated database backups


         Technologies Used
         
             AWS EC2

           Ubuntu Linux

              Nginx

              MySQL

         Bash scripting

            mysqldump

           Cron jobs

         Git & GitHub
        Linux networking



    Nginx Web Server Setup
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx


MySQL Database Setup

sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql


Create database and user
CREATE DATABASE webappdb;

CREATE USER 'webuser'@'%' IDENTIFIED BY 'StrongPassword123!';

GRANT ALL PRIVILEGES ON webappdb.* TO 'webuser'@'%';

FLUSH PRIVILEGES;


Enable Remote Database Access
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

Change:
bind-address = 127.0.0.1

To:
bind-address = 0.0.0.0

Restart MySQL
sudo systemctl restart mysql

Test Database Connection
mysql -h db-server -u webuser -p

Automated Database Backup
scripts/backup_db.sh

#!/bin/bash

Script:
#!/bin/bash

DATE=$(date +%F)

mysqldump --no-tablespaces \
-h 172.31.23.225 \
-u webuser \
-pStrongPassword123! \
webappdb > ~/db_backups/webappdb-$DATE.sql

echo "Backup completed: webappdb-$DATE.sql"


Automate Backups with Cron
crontab -e

Add:
0 2 * * * /home/ubuntu/backup_db.sh


Project Screenshots
Nginx Server

MySQL Database Server

Database Creation

Database Backup

Multi-Server Architecture

Skills Demonstrated

Linux system administration

AWS EC2 deployment

Nginx web server configuration

MySQL database management

multi-server networking

security group configuration

Bash automation

database backup and recovery

Git & GitHub version control


Future Improvements

Load balancer

Infrastructure monitoring (Prometheus & Grafana)

Docker containerization

CI/CD pipeline automation
