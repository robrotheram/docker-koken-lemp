#!/bin/bash

echo ""
PORT=90
# Root check
if [[ "$UID" -ne 0 ]]; then
	echo "!! This script requires root privileges. sudo ./create_koken.sh"
	echo ""
	exit
fi
echo "Cloning Build form https://github.com/robrotheram/docker-koken-lemp/"
git clone https://github.com/robrotheram/docker-koken-lemp.git koken-docker-build
cd koken-docker-build

echo -n "=> Building koken image (this may take a few minutes)..."
docker build -t robrotheram/koken .
echo "done."

echo -n "=> Creating /data/koken/www for persistent storage..."
mkdir -p /data/koken/www
echo "done."

echo "=> Starting Docker container..."
CID=$(docker run --restart=always -p $PORT:8080 --link mysql:mysql -v /data/koken/www:/usr/share/nginx/www -d robrotheram/koken /sbin/my_init)

echo -n "=> Waiting for Koken to become available.."

RET=0
while [[ RET -lt 1 ]]; do
	IP=$(docker inspect $CID | grep IPAddress | cut -d '"' -f 4)
	echo -n "."
	sleep 5
    RET=$(curl -s http://$IP:$PORT | grep "jquery" | wc -l)
done
echo "done."

echo "=> Ready! Load this server's IP address or domain in a browser to begin using Koken."
echo ""
echo "Clean up in progress"
echo "Clean Complete"
cd ../
rm -rf koken-docker-build


