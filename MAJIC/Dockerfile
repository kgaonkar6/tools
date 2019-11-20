FROM ubuntu:14.04
MAINTAINER gaonkark@email.chop.edu

RUN apt-get update && apt-get install -y \
	autoconf \
	automake \
	wget \
	build-essential \
	tar \
	git \
	libreadline-gplv2-dev \
	libncursesw5-dev \
	libssl-dev \
	libsqlite3-dev \
	tk-dev \
	libgdbm-dev \
	libc6-dev \
	libbz2-dev \
	python3 \
	python-dev \
	python3-dev \
	libffi-dev \
	libxml2-dev \
	libxslt1-dev \
	zlib1g-dev \
	libgsl0-dev \
	libcurl4-openssl-dev \
	liblzma-dev \
	libncurses5-dev \
	libperl-dev \
	python-pip 

# venv is provided with python3 
RUN sudo apt-get python3-venv

# change working directory
WORKDIR opt
# download and install htslib
RUN wget "https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2"
RUN tar -xvf htslib-1.9.tar.bz2   

# move to htslib-1.9
WORKDIR htslib-1.9 
RUN ./configure && make && make prefix=/opt/htslib-1.9 install

# set environment variables
RUN export HTSLIB_LIBRARY_DIR=/opt/htslib-1.9/lib 
RUN export HTSLIB_INCLUDE_DIR=/opt/htslib-1.9/include

# install majic
RUN python3 -m venv env
RUN source env/bin/activate
RUN pip install pip -U
RUN pip install wheel setuptools -U
RUN pip install cython numpy GitPython -U
RUN pip install Flask==1.0.2
RUN pip install waitress==1.1.0
RUN pip install scipy>=1.1.0
RUN pip install scipy==1.1.0
RUN pip install psutil>=5.4.8
RUN pip install psutil==5.4.8
RUN pip install h5py>=2.8.0
RUN pip install h5py==2.8.0
RUN pip install gunicorn==19.9.0
RUN pip install Flask-WTF==0.14.2

RUN pip install git+https://bitbucket.org/biociphers/majiq_stable.git#egg=majiq
