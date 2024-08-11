FROM nginx:stable-alpine
ARG TARGETARCH
EXPOSE 80
RUN apk update && apk add pandoc bash
# COPY templates.json /usr/share/nginx/html/templates.json
COPY --chmod=755 ./stacks /usr/share/nginx/html/
COPY --chmod=755 ./README.md /usr/share/nginx/html/
COPY --chmod=755 ./merge_json_files.sh /usr/bin/merge_json_files.sh
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
