#!/bin/bash
# 去掉空行
sed '/^\s*$/d' nowcoder.txt

awk 'NF!=0{print}' nowcoder.txt

awk NF a.txt

grep -v '^\s*$' 