#!/usr/bin/env bash
# Sets up web servers

apt-get -y update
apt-get -y install nginx

service nginx start

mkdir -p /data/web_static/releases/test
mkdir -p /data/web_static/shared
touch /data/web_static/releases/test/index.html

printf "<!DOCTYPE html>\n<html>\n<body>\n\t<h2>\n\t\tWelcome, Holbertonites!\n\t</h2>\n</body>\n</html>\n" > /data/web_static/releases/test/index.html

ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/
sed -i '/server_name _;/a location /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-available/default
service nginx restart
