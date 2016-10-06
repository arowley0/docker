DOCKER_BUILD=docker build --rm --build-arg="deb_mirror=100.64.79.10" -t
all:
	echo "all target not yet implemented"

clean:
	@rm -rf .tmp

.tmp:
	@mkdir $@

.tmp/apache.Docker: .tmp apache/Dockerfile
	@touch $@

apache.docker: .tmp/apache.Docker
	$(DOCKER_BUILD) andi/apache apache

apache.run: apache.docker
	bash runscripts/apache.sh

.tmp/php.Docker: apache.docker php/Dockerfile
	@touch $@

php.docker: .tmp/php.Docker
	$(DOCKER_BUILD) andi/php php 

php.run: php.docker
	bash runscripts/php.sh
