#!/bin/bash
echo "当前执行的进程的id=$$"
echo "helloworld" &
echo "后台运行的最后一个进程的进程号=$!"
date
echo "返回最后一个任务的执行状态=$?"