https://github.com/filebrowser/filebrowser

```
docker run \
    -v /:/srv \
    -p 8080:80 \
    filebrowser/filebrowser
```

```
version: "2"
services:
  filebrowser:
    image: filebrowser/filebrowser
    container_name: filebrowser
    hostname: filebrowser
    restart: unless-stopped
    ports:
      - 8002:80   
    volumes:
      - /:/srv
```
