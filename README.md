# Docker + Koken + nginx = ♥

Unoffical Image for installing koken. Major difference between this and the offical container is that this uses a seperate mysql container instead of one inbuilt into the container;
## Features

* Automatically sets up and configures the database for Koken and skips that step in the installation process.
* Adds a cron job to do periodic cleanup of the image cache.
* nginx/PHP configured for best Koken performance.
* Can be used on any machine with Docker installed.
* Uses seperate mysql container 

## Prequistis
1. Have Docker installed (https://www.docker.io/gettingstarted/#h_installation).
2. have a mysql container running see here for help of starting one up https://hub.docker.com/_/mysql/

##Simple setup
~~~bash
wget -qO- https://raw.githubusercontent.com/robrotheram/docker-koken-lemp/master/create_koken.sh | sudo bash
~~~
Server will now be running on port 90 and storage created at /data/koken


##Custom

1. Clone this repo
2. build the image "docker build -t name ."
3. docker run -d  -p <port>:8080 -v <dir for koken>:/usr/:/usr/share/nginx/www --link <mysql container name>:mysql <image name>  /sbin/my_init


