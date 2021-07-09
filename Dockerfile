FROM nginx:latest

MAINTAINER Mobydev

WORKDIR /usr/share/nginx/html

RUN apt-get update -y

RUN apt install git -y &&\
    git init &&\
    git clone git@github.com/romanutskyti/HW5.git

RUN ls -la