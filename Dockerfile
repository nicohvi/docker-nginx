FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# TODO: install nginx

# ensure yum is up to date
# yum update -y 

# install nginx
# yum install nginx -y

# ensure nginx runs in the foreground
# echo "\ndaemon off;" >> /etc/nginx/nginx.conf 

# add our scripts and templates
ADD . /

# expose port 80 to the world
EXPOSE 80

# debug
RUN mkdir -p /etc/nginx/sites-enabled

ENTRYPOINT ruby ./proxy_targets.rb #&& nginx
