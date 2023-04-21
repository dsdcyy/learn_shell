#!/bin/bash
# 从ps -aux 中计算cpu使用百分比
# 统计每个单词出现的个数

# tr 将指定字符转换 如小写转大写 tr a-z A-Z
# sort 自然排序第一行内容 -f 逆序 
# uniq -c 去重并在前面加上次数 
# awk '{print $2" "$1"}' 将列内容反过来
cat $1  | tr ' ' '\n' |sort |uniq -c|sort |awk '{print $2" "$1}'
