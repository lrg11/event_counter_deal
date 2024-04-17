#!/bin/bash  
if [ "$#" -ne 1 ]; then  
    echo "Usage: $0 <directory>"  
    exit 1  
fi  
  
# 获取目录参数  
dir="$1"
# 设定包含totalinfo.csv文件的目录  
# dir="./"  
  
# 初始化输出文件的计数器  
output_file_counter=1  
  
# 循环遍历目录下的所有totalinfo.csv文件  
for file in "$dir"/*totalinfo.csv; do  
    # 构造输出文件的名称  
    output_file="output_${output_file_counter}.csv"  
    output_file_counter=$((output_file_counter + 1))  
  
    # 使用awk处理csv文件并写入新的输出文件  
    awk -F, 'NR > 1 {  
        # 读取第二个、第三个和第四个元素  
        elem2 = $2 + 0
        elem3 = $3 + 0 
        elem4 = $4 + 0 
  
        # 计算要减去的值 (第三个和第四个元素之和除以19)  
        # subtract_value = (elem3 + elem4)  
  
        # 计算新的第二个元素的值  
	    # new_elem2 = (elem2 - (elem3 + elem4)) / 19 
	    new_elem2 = (elem2) / 21 
  
        # 输出新的行，第一个元素不变，第二个元素替换为新的值，其余元素原样输出  
        printf "%s,%f\n", $1, new_elem2
    }' "$file" > "$dir"/"$output_file"  
done
