# Dockerfile for installing and running nginx

# CentOS as the base image
FROM centos:centos7

# Install nginx
yum install nginx

# Start nginx when container starts
ENTRYPOINT /usr/sbin/nginx

