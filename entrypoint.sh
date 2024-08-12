#!/bin/bash
merge_json_files.sh
pandoc /usr/share/nginx/html/README.md -s --metadata charset=utf-8 -o /usr/share/nginx/html/index.html
nginx -g "daemon off;"
