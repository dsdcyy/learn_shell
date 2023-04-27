#!/bin/bash
: <<!
描述
假设命令运行的结果我们存储在nowcoder.txt里，格式如下：
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1  37344  4604 ?        Ss    2020   2:13 /sbin/init
root       231  0.0  1.5 166576 62740 ?        Ss    2020  15:15 /lib/systemd/systemd-journald
root       237  0.0  0.0      0     0 ?        S<    2020   2:06 [kworker/0:1H]
...
现在需要你统计VSZ，RSS各自的总和（以M兆为统计），输出格式如下
MEM TOTAL
VSZ_SUM:3250.8M,RSS_SUM:179.777M
!
awk '{vsz+=$5}{rss+=$6}END{print "MEM TOTAL\n" "VSZ_SUM:"vsz/1024"M,""RSS_SUM:"rss/1024"M"}' test35.txt


