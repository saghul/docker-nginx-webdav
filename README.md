# saghul/nginx-webdav

This Container is a simple nginx webserver configured for WebDAV access, and all relevant config files moved out the user via /config for ultimate control.

## Usage

```
docker create \
--name=nginx-webdav \
-v <path to config>:/config \
-v <path to data>:/data \
-e PGID=<gid> -e PUID=<uid>  \
-p 80:80 \
-e TZ=<timezone> \
saghul/nginx-webdav
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 80` - The web-services.
* `-v /config` - Contains all relevant configuration files.
* `-v /data` - Contains all files which will be shared with WebDAV.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` - timezone ie. `America/New_York`

It is based on Debian with the s6 overlay, for shell access whilst the container is running do `docker exec -it nginx-webdav /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

