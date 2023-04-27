#!/bin/bash
: <<!
描述
假设 Nginx 的日志存储在 nowcoder.txt 里，内容如下：
192.168.1.20 - - [21/Apr/2020:14:27:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.21 - - [21/Apr/2020:15:27:49 +0800] "GET /2/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.22 - - [21/Apr/2020:21:27:49 +0800] "GET /3/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.23 - - [21/Apr/2020:22:27:49 +0...
现在需要编写 Shell 脚本统计出 2020 年 4 月 23 号访问 IP 的对应次数，并且按照次数降序排序。你的脚本应该输出：
5 192.168.1.22
4 192.168.1.21
3 192.168.1.20
2 192.168.1.25
1 192.168.1.24
!

grep "23/Apr/2020" test24.txt | awk '{print $1}' | sort | uniq -c | sort -r | awk '{print $1,$2}'