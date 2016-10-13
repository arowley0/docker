#!/bin/bash

/etc/init.d/mysql start && \
    /etc/init.d/apache2 start && \
    tail -f \
	 /var/log/apache2/* \
	 /var/log/mysql/error.log
