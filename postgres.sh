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

#________________________all_DB________________________#

#!/bin/bash
# PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
# pathB=/backup/postgres

# find $pathB \( -name "*-1[^5].*" -o -name "*-[023]?.*" \) -ctime +61 -delete
# for dbname in $(echo "SELECT datname FROM pg_database;" | psql | tail -n +3 | head -n -2 | egrep -v 'template0|template1|postgres'); do
#     pg_dump $dbname | gzip >$pathB/$dbname-$(date "+%Y-%m-%d").sql.gz
# done
