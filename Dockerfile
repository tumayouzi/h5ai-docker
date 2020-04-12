FROM ubuntu:latest

LABEL maintainer "tumayouzi <tumayouzi@gmail.com>"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:ondrej/php && \
  apt-get update && \
  apt-get install -y nginx php7.4-fpm supervisor wget unzip patch

# Download and unzip h5ai
RUN wget https://release.larsjung.de/h5ai/h5ai-0.29.2.zip
RUN unzip h5ai-0.29.2.zip -d /usr/share/h5ai

# ADD nginx config file
ADD h5ai.nginx.conf /etc/nginx/sites-available/h5ai
RUN ln -s /etc/nginx/sites-available/h5ai /etc/nginx/sites-enabled/h5ai
RUN rm /etc/nginx/sites-enabled/default

# exec patch
ADD h5ai-path.patch patch
RUN patch -p1 -u -d /usr/share/h5ai/_h5ai/private/php/core/ -i /patch && rm patch

# php-fpm setup
RUN mkdir /run/php

# rm welcome to nginx file
RUN rm -rf /var/www/html

# use supervisor to monitor all services
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

VOLUME /var/www
