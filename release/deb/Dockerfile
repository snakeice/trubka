FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	ruby-dev \
	gcc \
	make \
	ruby \
	rubygems \
	build-essential

RUN gem install fpm --no-document

VOLUME [ "/tmp/fpm" ]
WORKDIR /tmp/fpm

ENTRYPOINT [ "/usr/local/bin/fpm" ]
CMD [ "--help" ]