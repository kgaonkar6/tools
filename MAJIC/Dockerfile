FROM ubuntu:18.04
MAINTAINER gaonkark@email.chop.edu

# ENV Variables
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
	autoconf \
	automake \
	wget \
	build-essential \
	tar \
	git \
	gcc-5 \
	libreadline-gplv2-dev \
	libncursesw5-dev \
	libssl-dev \
	libsqlite3-dev \
	tk-dev \
	python-dev \
	libgdbm-dev \
	libc6-dev \
	libbz2-dev \
	libffi-dev \
	libxml2-dev \
	libxslt1-dev \
	zlib1g-dev \
	libgsl0-dev \
	libcurl4-openssl-dev \
	liblzma-dev \
	libncurses5-dev \
	libperl-dev \
	python3.6 \
	python3.6-dev \
	python3-pip 

# venv is provided with python3 
# RUN sudo apt-get python3-venv

# change working directory
WORKDIR opt
# download and install htslib
RUN wget "https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2"
RUN tar -xvf htslib-1.9.tar.bz2   

# move to htslib-1.9
WORKDIR htslib-1.9 
RUN ./configure && make && make prefix=/opt/htslib-1.9 install
RUN ls /opt/htslib-1.9/
RUN pwd

# set environment variables
ENV HTSLIB_LIBRARY_DIR=/opt/htslib-1.9/lib 
ENV HTSLIB_INCLUDE_DIR=/opt/htslib-1.9/include

# install majic
RUN python3 --version
# RUN python3 -m pip install --user virtualenv
# RUN python3 -m venv env
# RUN source env/bin/activate
# RUN python3 -m pip install pip -U
RUN python3 -m pip install wheel setuptools -U
RUN python3 -m pip install cython numpy GitPython -U
RUN python3 -m pip install Flask==1.0.2
RUN python3 -m pip install waitress==1.1.0
RUN python3 -m pip install scipy>=1.1.0
RUN python3 -m pip install scipy==1.1.0
RUN python3 -m pip install psutil>=5.4.8
RUN python3 -m pip install psutil==5.4.8
RUN python3 -m pip install h5py>=2.8.0
RUN python3 -m pip install h5py==2.8.0
RUN python3 -m pip install gunicorn==19.9.0
RUN python3 -m pip install Flask-WTF==0.14.2

RUN python3 -m pip install git+https://bitbucket.org/biociphers/majiq_stable.git#egg=majiq
