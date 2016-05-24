#!/bin/bash
DIR=$(pwd)/web/
docker build --rm -t asurin/httpd c7-httpd/.
docker build --rm -t asurin/httpd-mariadb c7-httpd-mariadb/.
docker build --rm -t asurin/httpd-mariadb-php c7-httpd-mariadb-php/.
 docker run -d -p 80:80 -p 3306:3306 -v $DIR:/var/www -v $DIR/mysql:/var/lib/mysql asurin/httpd-mariadb-php
