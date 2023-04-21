#!/bin/bash
# 定义变量
A=100
# 输出变量
echo "A=$A"
# unset 撤销变量
unset A
echo "A=$A"
# readonly 定义只读变量
readonly B=20
echo "B=$B"
# 尝试修改
B=20
echo "B=$B"
# 尝试撤销
unset $B
echo "B=$B"
:<<!
    将命令的返回值赋给变量

    变量=\`命令\`

    A=date`反引号，运行里面的命令，并把结果返回给变量A

    变量=$(命令)

    A=$（date)等价于反引号
!
# 设置环境变量
# 在/etc/profile文件中定义TOMCAT_HOME环境变量
# export TOMCAT_HOME=/usr/local/apache-tomcat-10.1.5
# 刷新环境变量
# source /etc/profile