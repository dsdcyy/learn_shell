#!/bin/bash
# 案例1：打印命令行输入的参数[这里可以看出$*和$@的区别］

echo "is \$*.."
for i in "$*":
do
    echo "num is $i"
done

echo "is \$@..."

for i in "$@"
do
    echo "num is $i"
done

# 案例1：从1加到$1的值输出显示
S=0

for (( i=1; i<=$1; i++ ))
do
    S=$[$S+$i]
done
echo "1-100 num is $S"
