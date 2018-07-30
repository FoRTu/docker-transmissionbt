![Transmissionbt logo](https://raw.githubusercontent.com/FoRTu/docker-transmissionbt/master/logo.png) ![Transmission](https://transmissionbt.com/images/transmission.png)

## Transmission for Docker

A Docker container of [Transmission](https://transmissionbt.com/), the popular bittorrent client.

## How to start

The first step is to obtain a *transmission* configuration file, the **settings.json** file. All you have to do is run the following command:

```
docker run --rm -it [IMAGE] transmission-daemon --dump-settings > settings.json
```

Now is time to edit the file to define how *transmission* is going to work:

```
nano settings.json
```

You can edit all the parameters you want, but this ones are the minum you have to edit to run *transmission* properly: 

```
...
"rpc-authentication-required": 1
"rpc-whitelist-enabled": false,
"rpc-password": "USERNAME",
"rpc-username": "PASSWORD",
"download-dir": "/downloads",
...
```

Save changes and move `settings.json` to a secure place.

## Run a container

Use this tenplate:

```
docker run -d --rm --name "transmission" \
-p 9091:9091/tcp -p 51413:51413/tcp -p 51413:51413/udp \
-v [SETTINGS.JSON PLACE]:/etc/transmission-daemon \
-v [PLACE TO SAVE DOWNLOADS]:/downloads\
[DOCKER IMAGE]
```

For example:

```
docker run -d --rm --name "transmission" \
-p 9091:9091/tcp -p 51413:51413/tcp -p 51413:51413/udp \
-v /media/transmission/config:/etc/transmission-daemon \
-v /media/transmission/downloads:/downloads\
fortu/transmission
```
