#!/bin/sh

# Script for generate and copy the backup sql of the database of the actual project
#Author: Jorge L

ssh root@166.78.0.120 "mysqldump -u root -p123456 -h localhost wordpress > wordpress_db_backup.sql"
scp root@166.78.0.120:/root/wordpress_db_backup.sql puphpet/files/backup.sql
# mysqldump -u pantheon -p2dce08f7c2c448cf98a68bf08473b338 -hdbserver.dev.9b60317e-5ef4-4068-a7cd-519dc8b48f6b.drush.in -P16491 > vagrant-data/modules/mysql/files/backup.sql
