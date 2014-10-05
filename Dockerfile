FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# TODO: install nginx

# ENTRYPOINT ruby ./proxy_targets.rb 
ADD ./proxy_target.rb /etc/proxy_targets.rb
