#!/bin/bash
merge_json_files.sh
pandoc  /usr/share/nginx/html/README.md -o  /usr/share/nginx/html/index.html
nginx -g "daemon off; debug on;"
