#!/bin/bash

docker run -d \
       -p 80:80 \
       -p 443:443 \
       -v $PWD/volumes/apache2:/var/www \
       -t andi/apache24
