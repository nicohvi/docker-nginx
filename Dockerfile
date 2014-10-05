FROM ruby:2.1.3
MAINTAINER Nicolay Hvidsten <nicohvi@gmail.com>

# TODO: install nginx

ENTRYPOINT ruby ./proxy_targets.rb 

