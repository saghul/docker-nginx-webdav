FROM saghul/debian-s6

# install packages
RUN \
	apt-dpkg-wrap apt-get update && \
	apt-dpkg-wrap apt-get install -y nginx-light libnginx-mod-http-dav-ext && \
	rm -rf /var/lib/apt/lists/ && \
	rm -f /etc/nginx/conf.d/default.conf

# add local files
COPY rootfs/ /

# ports and volumes
EXPOSE 80
VOLUME /config
VOLUME /data

CMD ["nginx", "-c", "/config/nginx/nginx.conf"]
