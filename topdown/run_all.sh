#!/bin/bash  
if [ "$#" -ne 1 ]; then  
    echo "Usage: $0 <directory>"  
    exit 1  
fi  
  
# 获取目录参数  
DIR="$1"
# 指定目录  
# DIR="../ff64-data"  
  
# 使用find命令查找所有.log文件，并通过xargs传递给process.py  
find "$DIR" -type f -name "*.log" | xargs -I {} python3 process.py {}
