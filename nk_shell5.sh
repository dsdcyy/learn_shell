#!/bin/bash
# 打印空行的行号
cat  nowcoder.txt |grep -n ^\s*$ |cut -d ':' -f 1
