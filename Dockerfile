FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# TODO: install nginx

# ensure yum is up to date
RUN yum update -y 

# install nginx
RUN yum install nginx -y

# ensure nginx runs in the foreground
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf 

# add our scripts and templates
ADD . /

# expose port 80 to the world
EXPOSE 80

# debug
RUN mkdir -p /etc/nginx/sites-enabled

ENTRYPOINT ruby ./nginx_conf.rb && nginx
