#!/bin/bash
set -e

mariadbd --user=root &
/wait && mariadb -e 'create database eq; set password = password("eq2sqlite");'

REPO="$1"
FILE="$2"
FILENAME="${FILE%%.*}"
wget "https://github.com/$REPO/raw/main/utils/sql/database_full/$FILE" -O /tmp/db.tar.gz
tar -xvzf /tmp/db.tar.gz -C /tmp
rm /tmp/drop_system.sql

for i in /tmp/*.sql
do
    echo "Importing: $i"
    awk '/enable the sandbox mode/ {next} {print}' "$i" | mysql eq
done

exec mysql2sqlite -K -d eq -u root --mysql-password eq2sqlite -f "/tmp/out/$FILENAME.db"
