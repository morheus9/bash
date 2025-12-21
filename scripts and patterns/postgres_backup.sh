# Set PGPASSWORD=your's_pass_db

#!/bin/sh

DATE=$(date '+%Y-%m-%d')
echo "Saving dump db.."
pg_dump -h <ip> -p <port> -U <user> -v -F c -f db_$DATE.tar.gz <db name> 2> /opt/backup-db/dump_log_$DATE && [[ $? -eq 0 ]] \
&& curl -i -X GET "https://api.telegram.org/bot<bot id>:<bot token>/sendMessage?chat_id=<chat id>&text=Дамп базы данных снят успешно, на сервере <servername>" \
|| curl -i -X GET "https://api.telegram.org/bot<bot id>:<bot token>/sendMessage?chat_id=<chat id>&text=Во время снятия дампа произошла ошибка. Смотри лог на сервере <servername>"
