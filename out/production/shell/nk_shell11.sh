#!/bin/bash
# 行列转置
FILE=~/test_shell/d.txt
A=`head -n 1 $FILE |awk '{print NF}'`
for ((i=0; i<$A; i++))
do
    cat $FILE | awk '{print $i}'|tr '\n' ' '
    echo '\n'
done    
