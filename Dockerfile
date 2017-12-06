#Version:0.0.1
FROM centos
MAINTAINER Steven "steven@qq.com"
ENV REFRESHED_AT 2017-12-6
ADD nginx.repo /etc/yum.repos.d
RUN yum install net-tools openssh-server nginx -y
RUN echo 'Hi,I am in your container' > /usr/share/nginx/html/index.html
ENV NGINX_RUN_USER nginx
ENV NGINX_RUN_GROUP nginx
ENV TARGET_DIR /opt
WORKDIR $TARGET_DIR
VOLUME ["/opt/project","/data"]
EXPOSE 80 22
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]