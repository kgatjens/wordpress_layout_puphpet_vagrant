#!/bin/sh

# Script for generate and copy the backup sql of the database of the actual project
#Author: Jorge L

#-i
pwd
ssh -i ../.vagrant/machines/default/virtualbox/private_key vagrant@dev.wordpress.composer "mysqldump -uroot -p123456  -h localhost wordpress > backup.sql"
scp -i ../.vagrant/machines/default/virtualbox/private_key vagrant@dev.wordpress.composer:/home/vagrant/backup.sql ../puphpet/files/backup.sql
