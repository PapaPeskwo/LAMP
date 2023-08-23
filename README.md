# Run
```bash
docker-compose up -d
```

# Try The Services
## Apache Web Server (lamp_apache):
In your webbrowser, type in: http://localhost:8080
This should display "It works!"

## PHP (lamp_php):
I did not have anything in my `php-files` directory, so lets make something:
```bash
nano php-files/index.php
```
Add a simple line to the file:
```php
<?php
echo "Hello, World!";
?>
```

## MySQL Database (lamp_mysql)
`mysql -h 127.0.0.1 -P 3306 -u root -p` doesn't work...
`docker exec -it lamp_mysql_1 mysql -uroot -ppoopypants` works

# Errors
If you have tried "upping" the compose previously, try:
```bash
docker-compose down
docker-compose up -d
```

## Used ports
You might have something running on the same ports. Try:
```bash
docker ps
docker stop <container_id>
docker rm <container_id>
```
(stop, rm all: `docker stop $(docker ps -a -q)`

Alternatively, change the ports in the `docker-compose.yml` file.

## Check for Orphaned Docker Networks:
In some cases, orphaned Docker networks might cause port conflicts. You can remove all unused networks using:

```bash
docker network prune
```
