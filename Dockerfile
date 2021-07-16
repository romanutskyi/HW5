FROM nginx:latest

MAINTAINER Mobydev

WORKDIR /usr/share/nginx/html

RUN apt-get update -y

RUN rm *

RUN apt install git -y &&\
    git clone https://github.com/romanutskyi/HW5.git ./

RUN ls -la



