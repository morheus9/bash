#!/bin/sh

PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

PGPASSWORD=some_password
export PGPASSWORD
pathB=/mnt/backup
dbUser=dbadmin
database=zabbix

find $pathB \( -name "*-1[^5].*" -o -name "*-[023]?.*" \) -ctime +61 -delete
pg_dump -U $dbUser $database | gzip >$pathB/pgsql_$(date "+%Y-%m-%d").sql.gz

unset PGPASSWORD

# crontab -e
# 3 0 * * * /etc/scripts/pgsql_dump.sh # postgres pg dump
