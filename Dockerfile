FROM nginx:stable-alpine
ARG TARGETARCH
EXPOSE 80
RUN apk update && apk add pandoc bash
# COPY templates.json /usr/share/nginx/html/templates.json
COPY --chmod=755 ./logo /usr/share/nginx/html/logo/
COPY --chmod=755 ./stacks /usr/share/nginx/html/
COPY --chmod=755 ./robots.txt /usr/share/nginx/html/robots.txt
COPY --chmod=755 ./favicon.ico /usr/share/nginx/html/favicon.ico
COPY --chmod=755 ./logo.png /usr/share/nginx/html/logo.png
COPY --chmod=755 ./README.md /usr/share/nginx/html/
COPY --chmod=755 ./merge_json_files.sh /usr/bin/merge_json_files.sh
COPY --chmod=755 ./convert_md_to_html.sh /usr/bin/convert_md_to_html.sh
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
