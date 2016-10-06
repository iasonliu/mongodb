FROM alpine:edge
MAINTAINER iasonliu@gmail.com

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache mongodb && \
  mkdir -p /data/db && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/share/man

VOLUME /data/db
ADD docker-entrypoint.sh /entrypoint.sh
ADD set_password.sh /set_password.sh

EXPOSE 27017 28017
CMD ["mongod"]
