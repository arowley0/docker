DOCKER_BUILD=@docker build --rm --build-arg="deb_mirror=100.64.79.10" -t
all:
	echo "all target not yet implemented"

clean:
	@rm -rf .tmp

.tmp:
	@mkdir $@

.tmp/apache.Docker: .tmp apache/Dockerfile
	@touch $@

apache.docker: .tmp/apache.Docker
	$(DOCKER_BUILD) andi/apache apache 1>&2

apache.run: apache.docker
	@bash runscripts/apache.sh

.tmp/php.Docker: apache.docker php/Dockerfile
	@touch $@

php.docker: .tmp/php.Docker
	$(DOCKER_BUILD) andi/php php 1>&2

php.run: php.docker
	@bash runscripts/php.sh

.tmp/lamphp.Docker: php.docker lamphp/Dockerfile
	@touch $@

lamphp.docker: .tmp/lamphp.Docker
	$(DOCKER_BUILD) andi/lamphp lamphp 1>&2

lamphp.run: lamphp.docker
	@bash runscripts/lamphp.sh

