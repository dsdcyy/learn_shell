#!/bin/bash
# "ok"="ok"?
if [ "ok" = "ok" ]
then echo "equal"
else echo "not equal"
fi
# 23大于22?
if [ 23 -ge 22 ]
then echo "23 greater than 22"
else echo "23 is less than 22"
fi

if [ -f ~/aaa.txt ]
then echo "aaa.txt exists"
else echo "aaa.txt does not exist"
fi