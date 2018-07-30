## (UNDER DEVELOPMENT)

# docker_transmissionbt
Docker image of the transmissionbt

### Generate configure files
docker run --rm -it [IMAGE] transmission-daemon --dump-settings > settings.json

### Edit settings.json
sudo nano settings.json

```
...
"rpc-authentication-required": 1
"rpc-whitelist-enabled": false,
"rpc-password": "USERNAME",
"rpc-username": "PASSWORD",
"download-dir": "/downloads",
...
```

Save changes and move `settings.json` to a secure place


### RUN !!
docker run -d --rm --name "transmission" -p 9091:9091/tcp -p 51413:51413/tcp -p 51413:51413/udp -v [SETTINGS.JSON PLACE]:/etc/transmission-daemon [PLACE TO SAVE DOWNLOADS]:/downloads test/transmission
docker run -d --rm --name "transmission" -p 9092:9092/tcp -p 51413:51413/tcp -p 51413:51413/udp -v Transmission:/etc/transmission-daemon -v /media/Otros/Bittorrent/Done:/Downloads test/transmission

