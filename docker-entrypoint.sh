#!/bin/bash
set -e

mariadbd --user=root &
/wait && mariadb -e 'create database eq; set password = password("eq2sqlite");'

FILE="$1"
FILENAME="${FILE%%.*}"
wget "https://github.com/SecretsOTheP/EQMacEmu/raw/main/utils/sql/database_full/$FILE" -O /tmp/db.tar.gz
tar -xvzf /tmp/db.tar.gz -C /tmp
rm /tmp/drop_system.sql

for i in /tmp/*.sql
do
    echo "Importing: $i"
    mysql eq < "$i"
done

exec mysql2sqlite -K -d eq -u root --mysql-password eq2sqlite -f "/tmp/out/$FILENAME.db"
