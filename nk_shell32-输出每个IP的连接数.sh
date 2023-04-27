#!/bin/bash
: <<!
描述
假设netstat命令运行的结果我们存储在nowcoder.txt里，格式如下：
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:6160            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
...
现在需要你输出每个IP的连接数，按照连接数降序排序。你的脚本应该输出
172.16.0.24 10
172.16.34.144 9
100.100.142.4 3
...

!

grep 'tcp' test32.txt|awk '{print$(NF-1)}'|awk -F ":" '{print $1}'|sort|uniq -c|sort -nr|awk '{print $2,$1}'

