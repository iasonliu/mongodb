FROM alpine:edge
MAINTAINER iasonliu@gmail.com

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache mongodb

VOLUME /data/db

EXPOSE 27017
CMD ["mongod"]
