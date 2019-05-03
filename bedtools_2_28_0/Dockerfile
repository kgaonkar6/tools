FROM ubuntu:14.04

# maintainer
MAINTAINER Krutika Gaonkar

RUN apt-get update && apt-get install -y \
	autoconf \
	automake \
	python2.7 \
	python-pip \
	make \
	g++ \
	gcc \
	build-essential \ 
	zlib1g-dev \
	libgsl0-dev \
	perl \
	curl \
	git \
	wget \
	unzip \
	tabix \
	libncurses5-dev

WORKDIR /opt
RUN wget https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools-2.28.0.tar.gz \
    && tar -zxvf bedtools-2.28.0.tar.gz
WORKDIR /opt/bedtools2

RUN make 

WORKDIR /opt/bedtools2/bin

