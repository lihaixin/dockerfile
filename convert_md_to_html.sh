#!/bin/bash

# 定义转换函数
local md_file="$1"
local dir_name=$(dirname "$md_file")
(cd "$dir_name" &&pandoc README.md -s --metadata charset=utf-8 --metadata title="README 指南" -o index.html)
