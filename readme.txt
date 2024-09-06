docker-compose build
docker-compose up -d

docker ps





Juste apres avoir lance le container moodle


docker exec -it <moodle_container_name> /bin/bash
chown -R www-data:www-data /var/www
chmod -R 775 /var/www/html




<moodle_container_name> est l'id du container du projer contenant l'image moodle
docker exec -it 308211b68779 /bin/bash


docker exec 308211b68779 mysqldump -u root -p moodle > backup.sql

docker exec 308211b68779 mysqldump -u moodleuser -p moodle > /tmp/backup.sql
