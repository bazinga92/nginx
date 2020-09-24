#docker build --rm -t bazinga92/nginx .
FROM debian:10.5

LABEL maintainer="Bazinga92 nginx"

ENV DEBIAN_FRONTEND noninteractive
#ARG NGINX_VERSION=


RUN apt update \
&& apt install --yes --no-install-recommends \
nginx \
wget \
vim \
tzdata \
&& ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime \
&& dpkg-reconfigure -f noninteractive tzdata \
&& rm -rf /var/lib/apt/lists/* \
&& ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log 


CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
