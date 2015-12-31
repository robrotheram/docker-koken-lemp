#!/bin/bash

#########################################################
# The following should be run only if Koken hasn't been #
# installed yet                                         #
#########################################################

if [ ! -f /usr/share/nginx/www/storage/configuration/database.php ] && [ ! -f /usr/share/nginx/www/database.php ]; then

  # Generate Koken database and user credentials
  echo "=> Generating database and credentials"
  KOKEN_DB="gallery"
  KOKEN_PASSWORD=`pwgen -c -n -1 12`

  mysql -h$MYSQL_PORT_3306_TCP_ADDR -uroot -p$MYSQL_ENV_MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ENV_MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -h$MYSQL_PORT_3306_TCP_ADDR -uroot -p$MYSQL_ENV_MYSQL_ROOT_PASSWORD -e "CREATE DATABASE gallery; GRANT ALL PRIVILEGES ON gallery.* TO 'koken'@'%' IDENTIFIED BY '$KOKEN_PASSWORD'; FLUSH PRIVILEGES;"
  mysql -h$MYSQL_PORT_3306_TCP_ADDR -uroot -p$MYSQL_ENV_MYSQL_ROOT_PASSWORD gallery < /alterations.sql
  echo "=> Setting up Koken"
  # Setup webroot
  rm -rf /usr/share/nginx/www/*
  mkdir -p /usr/share/nginx/www

  # Move install helpers into place
  mv /installer.php /usr/share/nginx/www/installer.php
  mv /user_setup.php /usr/share/nginx/www/user_setup.php

  # Configure Koken database connection
  mv /database.php /usr/share/nginx/www/database.php
  echo $KOKEN_PASSWORD >> /pass.txt
  sed -i -e "s/___PWD___/$KOKEN_PASSWORD/" /usr/share/nginx/www/database.php
  sed -i -e "s/___HOST___/$MYSQL_PORT_3306_TCP_ADDR/" /usr/share/nginx/www/database.php

  chown www-data:www-data /usr/share/nginx/www/
  chmod -R 777 /usr/share/nginx/www
fi

################################################################
# The following should be run anytime the container is booted, #
# incase host is resized                                       #
################################################################

# Set PHP pools to take up to 1/2 of total system memory total, split between the two pools.
# 30MB per process is conservative estimate, is usually less than that
PHP_MAX=$(expr $(grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//') / 1024 / 2 / 30 / 2)
sed -i -e"s/pm.max_children = 5/pm.max_children = $PHP_MAX/" /etc/php5/fpm/pool.d/www.conf
sed -i -e"s/pm.max_children = 5/pm.max_children = $PHP_MAX/" /etc/php5/fpm/pool.d/images.conf

# Set nginx worker processes to equal number of CPU cores
sed -i -e"s/worker_processes\s*4/worker_processes $(cat /proc/cpuinfo | grep processor | wc -l)/" /etc/nginx/nginx.conf
