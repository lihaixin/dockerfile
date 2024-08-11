FROM --platform=${TARGETPLATFORM} alpine:latest
ARG TARGETARCH
RUN apk update && apk add nginx pandoc
# COPY templates.json /usr/share/nginx/html/templates.json
COPY --chmod=755 ./stacks /usr/share/nginx/html/
COPY --chmod=755  README.md /usr/share/nginx/html/
COPY --chmod=755 merge_json_files.sh /usr/bin/merge_json_files.sh
COPY --chmod=755 entrypoint.sh /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
