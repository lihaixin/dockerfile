#!/bin/bash

# 设定目标合并文件的名称
output_file="merged_files.json"

# 初始化该文件（如果存在则清空内容）
> "$output_file"

# 使用find命令查找当前目录下所有子目录中的.json文件
# 然后使用cat命令将它们的内容追加到输出文件中
find . -type f -name "*.json" -not -path "./merged_files.json" | while read file; do
    cat "$file" >> "$output_file"
done

echo "合并完成，所有.json文件内容已保存至 $output_file"
