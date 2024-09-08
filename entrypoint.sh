#!/bin/bash

# 使用find查找所有README.md文件，并在每个文件所在目录执行转换
find /usr/share/nginx/html -type f -name README.md -exec bash -c 'convert_md_to_html.sh "$0"' {} \;
echo "所有符合条件的README.md文件已转换为所在目录下的index.html。"
convert_md_to_html.sh
# pandoc /usr/share/nginx/html/README.md -s --metadata charset=utf-8 --metadata title="README 指南" -o /usr/share/nginx/html/index.html
nginx -g "daemon off;"
