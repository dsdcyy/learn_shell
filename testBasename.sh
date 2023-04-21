#!/bin/bash
S=`basename /home/aaa/test.txt`
echo "基本文件名是: $S"
J=`basename /home/aaa/test.txt .txt`
echo "去除基本文件名后缀是: $J"