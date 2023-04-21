#!/bin/bash
# 打印字母数小于8的单词

cat nowcoder.txt | xargs -n 1 | awk 'length($1)<8 {print $1}'

