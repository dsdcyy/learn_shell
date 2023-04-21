#!/bin/bash
SUM=0
I=0
while [ $I -le $1 ]
do
    SUM=$[$SUM+$I]
    I=$[$I+1]
done
echo "sum is $SUM"    
