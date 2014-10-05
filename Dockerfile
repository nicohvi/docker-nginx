FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# TODO: install nginx

ADD ./proxy_targets.rb proxy_targets.rb
ENTRYPOINT ruby ./proxy_targets.rb 
