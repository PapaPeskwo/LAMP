# Backup MySQL Database

```bash

#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/path/to/your/backup/directory"
DB_NAME="your_db_name"

docker exec lamp_mysql_1 /usr/bin/mysqldump -uroot -ppoopypants $DB_NAME > $BACKUP_DIR/dbbackup_$TIMESTAMP.sql
```
# Restore MySQL Database

```bash

#!/bin/bash

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "Please provide a path to the SQL backup file."
    exit 1
fi

cat $BACKUP_FILE | docker exec -i lamp_mysql_1 /usr/bin/mysql -uroot -ppoopypants your_db_name
```
# View Apache Logs

```bash

#!/bin/bash

docker logs lamp_apache_1
```
# Follow Apache Logs (real-time updates)

```bash

#!/bin/bash

docker logs -f lamp_apache_1
```
# Quick Shell Access to PHP or Apache Containers

```bash

#!/bin/bash

echo "Which container do you want to access?"
echo "1) PHP"
echo "2) Apache"
read -p "Enter choice: " choice

case $choice in
    1)
        docker exec -it lamp_php_1 /bin/bash
        ;;
    2)
        docker exec -it lamp_apache_1 /bin/bash
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac
```
# Check Disk Usage of Docker Containers

```bash

#!/bin/bash

docker system df
```
# Prune Unused Docker Resources
To clean up unused containers, networks, and images:

```bash

#!/bin/bash

docker system prune -a
```