FROM debian:jessie
MAINTAINER redacted@c9h.org
ARG deb_mirror=httpredir.debian.org
RUN perl -pi -e "s{httpredir.debian.org/debian jessie main}{${deb_mirror}/debian jessie main}" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    	    apache2

EXPOSE 80 443
VOLUME /var/www
COPY start-apache.sh /tmp
CMD [ "/bin/bash","/tmp/start-apache.sh" ]



