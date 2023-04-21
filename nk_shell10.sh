#!/bin/bash
# 第二列是否有重复

cat nowcoder.txt |awk '{print $2}'|sort|uniq -c|sort | grep -v 1
