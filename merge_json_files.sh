#!/bin/bash

merge_json_files(){
    cd /usr/share/nginx/html/
    
    # 输出文件名作为第一个参数，如果没有提供，默认为"index.json"
    output_file="${1:-index.json}"

    # 如果提供了第二个参数及以后，视为要合并的文件名
    if [ "$#" -gt 1 ]; then
        files=("${@:2}") # 从第二个参数开始，获取所有要合并的文件名
    else
        # 默认合并的文件列表
        files=("1.json" "2.json" "3.json")
    fi

    # 初始化该文件（如果存在则清空内容）
    > "$output_file"
    # 添加创建头部规则
    cat >> "$output_file"<< TEMPEOF
{
	"version": "2",
	"templates": [
TEMPEOF

    for file_pattern in "${files[@]}"; do
        # 使用find命令查找匹配的.json文件
        find . -type f -name "$file_pattern" ! -path "./$output_file" | while read file; do
            cat "$file" >> "$output_file"
        done
    done

    # 添加路由尾部
    sed -i '$d' "$output_file"
    sleep 1
    cat >> "$output_file"<< TEMPEOF       
	]
}
TEMPEOF
    echo "合并完成，所有"$files"文件内容已保存至 $output_file"
}

# 示例用法：
# 合并默认文件到默认输出文件名
merge_json_files

# 合并特定文件到指定输出文件
merge_json_files "index1.json" "1.json"
merge_json_files "index3.json" "3.json"
