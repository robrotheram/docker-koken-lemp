My own custome SSL support for more general ssl support go to https://github.com/robrotheram/docker-koken-lemp/blob/SSL-Support


## Features
* Automatically sets up and configures the database for Koken and skips that step in the installation process.
* Adds a cron job to do periodic cleanup of the image cache.
* nginx/PHP configured for best Koken performance.
* Can be used on any machine with Docker installed.
* Uses seperate mysql container

## Prerequisites
1. Have Docker installed (https://www.docker.io/gettingstarted/#h_installation).
2. have a mysql container running see here for help of starting one up https://hub.docker.com/_/mysql/

## Simple Setup
~~~bash
wget -qO- https://raw.githubusercontent.com/robrotheram/docker-koken-lemp/master/create_koken.sh | sudo bash
~~~
Server will now be running on port 90 and storage created at /data/koken


## Custom Installation
1. Clone this repo
2. Build the image `docker build -t image-name .`
3. `docker run -d -p <port>:8080 -p <port>:443 -v <certs dir>:/etc/nginx/certs -v <dir for koken>:/usr/share/nginx/www --link <mysql container name>:mysql <image-name> /sbin/my_init`
