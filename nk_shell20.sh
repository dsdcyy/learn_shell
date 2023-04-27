#!/bin/bash
: <<!
描述
假设有一个nowcoder.txt，编写脚本，打印只有一个数字的行。

假设nowcoder.txt内容如下：
haha
1
2ab
cd
77
那么你的脚本应该输出
1
2ab
!
#awk -F "[0-9]" '{if(NF==2) print $0}' test20.txt
grep -E '^[a-Z]*[0-9][a-Z]*$' test20.txt

