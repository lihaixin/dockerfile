#!/bin/bash
cd /usr/share/nginx/html/
# 设定目标合并文件的名称
output_file="index.json"

# 初始化该文件（如果存在则清空内容）
> "$output_file"
# 添加创建头部规则
cat >> $output_file<< TEMPEOF
{
	"version": "2",
	"templates": [
TEMPEOF


# 使用find命令查找当前子目录中的.json文件
# 然后使用cat命令将它们的内容追加到输出文件中
find . -type f \( -name "1.json" -o -name "2.json" -o -name "3.json" \) ! -path "./index.json" | while read file; do
    cat "$file" >> "$output_file"
done

# 添加路由尾部
sed -i '$d' $output_file
sleep 1
cat >> $output_file<< TEMPEOF       
	]
}
TEMPEOF
echo "合并完成，所有.json文件内容已保存至 $output_file"
