#!/bin/bash
: <<!
描述
假设netstat命令运行的结果我们存储在nowcoder.txt里，格式如下：
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:6160            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
...
现在需要编写shell脚本查看系统tcp连接中各个状态的连接数，并且按照连接数降序输出。你的脚本应该输出如下：
ESTABLISHED 22
TIME_WAIT 9
LISTEN 3
!

grep 'tcp' | awk '{print $6}' | sort |uniq -c  | sort -k 1  -nr| awk '{print $2" "$1}'