# Resilio Sync
#
# VERSION               0.1
#

FROM debian:stretch-slim

LABEL maintainer="MAINTAINER Resilio Inc. <support@resilio.com>"
LABEL com.resilio.version="2.6.3"

ADD https://download-cdn.resilio.com/2.6.3/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555
EXPOSE 55555/udp

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]
