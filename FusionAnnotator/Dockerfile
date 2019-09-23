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
	libbz2-dev

WORKDIR opt
# Install FusionAnnotator
# STARfusion 1.50 bundled FusionAnnotator
# STARfusion release 1.5.0 https://github.com/STAR-Fusion/STAR-Fusion/tree/ef595ad49a72ab860f1732223bb9274c98e9ebfb
# FusionAnnotator bundled https://github.com/FusionAnnotator/FusionAnnotator/tree/9cd889a87c838243555f14beabfc677f539084a3 

RUN git clone https://github.com/FusionAnnotator/FusionAnnotator.git && \
    cd FusionAnnotator && \
    git checkout 9cd889a && \

ENV FUSION_ANNOTATOR ${SRC}/FusionAnnotator
