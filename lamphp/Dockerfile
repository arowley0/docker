FROM andi/php
MAINTAINER redacted@c9h.org
ARG deb_mirror=httpredir.debian.org
RUN perl -pi -e "s{httpredir.debian.org/debian jessie main}{${deb_mirror}/debian jessie main}" /etc/apt/sources.list
RUN apt-get update && \
    echo 'mysql-server mysql-server/root_password password y3rm0m' | debconf-set-selections; \
    echo 'mysql-server mysql-server/root_password_again password y3rm0m' | debconf-set-selections; \
    apt-get install -y --no-install-recommends \
    mariadb-server

EXPOSE 80 443
VOLUME /var/www
VOLUME /var/lib/mysql

COPY my.cnf /etc/mysql
COPY start-lamp.sh /tmp
CMD [ "/bin/bash","/tmp/start-apache.sh" ]



