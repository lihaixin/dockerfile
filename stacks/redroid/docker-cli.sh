docker run -itd --rm --privileged \
    --pull always \
    -v /dev/binder1:/dev/binder \
    -v /dev/binder2:/dev/hwbinder \
    -v /dev/binder3:/dev/vndbinder \
    -v ~/data13:/data \
    -p 5555:5555 \
    --name redroid13 \
    redroid/redroid:13.0.0-latest
