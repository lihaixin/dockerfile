docker run -d \
-p 9443:9443 \
-p 8000:8000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /var/portainer_data:/data \
-e TPORT=8000 \
-e COUNTRY=cn \
-e PASSWORD="@china1234567" \
--name ui \
--restart=always \
lihaixin/portainer:ce-2.24.1
