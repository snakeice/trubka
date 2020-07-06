FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	ruby-dev \
	gcc \
	make \
	ruby \
	rubygems \
	build-essential

RUN gem install fpm --no-document
ENTRYPOINT [ "/usr/local/bin/fpm" ]