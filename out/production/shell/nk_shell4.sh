#!/bin/bash
# SHELL4 输出第5行的内容
cat nowcoder.txt | awk 'NR==5{print}'
# sed -n 5p a.txt
