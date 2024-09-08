#!/bin/bash

# 定义转换函数
convert_md_to_html() {
    local md_file="$1"
    local dir_name=$(dirname "$md_file")
    cd "$dir_name" || exit
    pandoc README.md -s --metadata charset=utf-8 --metadata title="README 指南" -o index.html
    cd - > /dev/null
}

# 使用find查找所有README.md文件，并在每个文件所在目录执行转换
find /usr/share/nginx/html -type f -name README.md -execdir bash -c 'convert_md_to_html "$0"' {} \;

echo "所有符合条件的README.md文件已转换为所在目录下的index.html。"
