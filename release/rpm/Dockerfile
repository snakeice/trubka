FROM centos:latest

RUN yum install -y \
	ruby-devel \
	gcc \
	make \
	ruby \
	rpm-build \
	rpm-sign && yum clean all

RUN gem install fpm --no-document
ENTRYPOINT [ "/usr/local/bin/fpm" ]