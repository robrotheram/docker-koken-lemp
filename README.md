##Custome SSL support by adding a cert directory and exposing port 443
* Currently uses port 8444 for ssl
* Certs are stored in /data/nginx/certs 
* Certs need to be created I suggest using LetsEncrypt 

Unoffical Image for installing Koken. Major difference between this and the offical container is that this uses a seperate mysql container instead of one inbuilt into the container;

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
wget -qO- https://github.com/robrotheram/docker-koken-lemp/blob/SSL-Support/create_koken.sh | sudo bash
~~~
Server will now be running on port 90 and 8444 for ssl  and storage created at /data/koken and certs in /data/nginx/certs 


## Custom Installation
1. Clone this repo
2. Build the image `docker build -t image-name .`
3. `docker run -d -p <port>:8080 -p <port>:443 -v <certs dir>:/etc/nginx/certs -v <dir for koken>:/usr/share/nginx/www --link <mysql container name>:mysql <image-name> /sbin/my_init`
