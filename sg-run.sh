#!/bin/bash  
  
# 检查参数数量  
if [ "$#" -ne 1 ]; then  
    echo "请提供一个路径作为参数"  
    exit 1  
fi

# 获取相对路径参数
relpath="$1"

# 使用realpath命令转换为绝对路径
abspath=$(realpath "$relpath")

cd topdown
./run_all.sh "$abspath"

cd ..
./data_proc.sh "$abspath"

printf "Done\n"
