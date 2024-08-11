FROM --platform=${TARGETPLATFORM} alpine:latest
ARG TARGETARCH
RUN apk update &&apk add nginx
COPY templates.json /usr/share/nginx/html/templates.json
COPY --chmod=755 merge_json_files.sh /usr/bin/merge_json_files.sh
COPY --chmod=755 entrypoint.sh /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
