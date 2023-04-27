#!/bin/bash
: <<!
描述
假设netstat命令运行的结果我们存储在nowcoder.txt里，格式如下：
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:6160            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
...
现在需要你查看和本机3306端口建立连接并且状态是established的所有IP，按照连接数降序排序。你的脚本应该输出
10 172.16.0.24
9 172.16.34.144
1 172.16.34.143
!

grep '3306' test31.txt|grep 'ESTABLISHED'|awk '{print$5}'|sort|uniq -c|sort -nr|awk '{print $1,$2}'|cut -d ':' -f 1