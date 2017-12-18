FROM saghul/debian-s6

# install packages
RUN \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
    cron logrotate nginx-light libnginx-mod-http-dav-ext && \

# configure nginx
 rm -f /etc/nginx/conf.d/default.conf

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config
VOLUME /data
