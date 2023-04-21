#!/bin/bash
# 从ps -aux 中计算cpu使用百分比

ps -aux |awk 'BEGIN {sum=0} /[0-9]/ {sum+=$4} END{print sum}'


