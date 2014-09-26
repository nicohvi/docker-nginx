# Dockerfile for installing and running nginx

# CentOS as the base image
FROM centos:centos7

# Add the nginx yum repo
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

# Install nginx
RUN yum install nginx -y

# Start nginx when container starts
ENTRYPOINT systemctl start nginx.service

