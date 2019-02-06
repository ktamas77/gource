FROM ubuntu:16.04

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget make g++ gcc pkg-config software-properties-common psmisc
RUN apt-get install -y libpcre3-dev libglew-dev libsdl2-dev libsdl2-image-dev
RUN apt-get install -y libpng12-dev libboost-all-dev libglm-dev libavcodec-extra
RUN apt-get install -y libnetpbm10-dev libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y libfreetype6-dev libtinyxml-dev ffmpeg
RUN apt-get install -y xvfb xfonts-base xfonts-75dpi xfonts-100dpi

RUN mkdir -p /install/gource && cd /install/gource
WORKDIR /install/gource
RUN wget -q https://github.com/acaudwell/Gource/releases/download/gource-0.49/gource-0.49.tar.gz
RUN tar -vzxf gource-0.49.tar.gz

WORKDIR /install/gource/gource-0.49
RUN ./configure && make && make install

RUN mkdir -p /codebuild_config
COPY buildspec.yml /codebuild_config

WORKDIR /home
RUN rm -rf /install
