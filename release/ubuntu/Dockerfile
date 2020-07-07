FROM golang:latest

RUN apt-get update && apt-get install -y \
	gnupg \
	pbuilder \
	ubuntu-dev-tools \
	apt-file

ARG VERSION
ARG COMMIT
ARG RUNTIME
ARG BUILT
ENV DEBFULLNAME="Alex Golshani"
ENV DEBEMAIL="xitonix.io@gmail.com"
ENV EXECUTABLE=trubka


#RUN pbuilder-dist Bionic create
RUN wget -O $EXECUTABLE-$VERSION.tar.gz https://github.com/xitonix/trubka/archive/v$VERSION.tar.gz
RUN tar xvf $EXECUTABLE-$VERSION.tar.gz  -C src/
RUN mv src/$EXECUTABLE-$VERSION/* src/ && rm -rf src/$EXECUTABLE-$VERSION $EXECUTABLE-$VERSION.tar.gz
WORKDIR src/
RUN go build -i -v -o ../bin/$EXECUTABLE -ldflags="-s -w -X main.version=v$VERSION -X main.commit=$COMMIT -X main.runtimeVer=$RUNTIME -X main.built=$BUILT"  *.go
ENTRYPOINT [ "/bin/bash" ]