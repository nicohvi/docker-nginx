# Dockerfile for installing and running nginx

# CentOS as the base image
FROM centos

# Add the nginx yum repo
# RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN rpm -Uvh http://nginx.org/packages/centos/6/x86_64/RPMS/nginx-1.6.2-1.el6.ngx.x86_64.rpm
# Install nginx
RUN yum install nginx -y

# The container should run only one service.
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports from the container to the outside
EXPOSE 80

# Run
CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf
