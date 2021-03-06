FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# ensure yum is up to date
RUN apt-get update -y

# install nginx
RUN apt-get install nginx -y

# ensure nginx runs in the foreground
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf 

# add our scripts and templates
ADD . /

# expose port 80 to the world
EXPOSE 80

# expose volumes
VOLUME ['/etc/nginx/']

ENTRYPOINT ruby ./nginx_conf.rb && nginx
