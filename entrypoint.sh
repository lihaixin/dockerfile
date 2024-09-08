#!/bin/bash
merge_json_files.sh
convert_md_to_html.sh
# pandoc /usr/share/nginx/html/README.md -s --metadata charset=utf-8 --metadata title="README 指南" -o /usr/share/nginx/html/index.html
nginx -g "daemon off;"
