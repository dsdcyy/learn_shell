#!/bin/bash
: <<!
描述
假设nginx的日志我们存储在nowcoder.txt里，格式如下：
192.168.1.20 - - [21/Apr/2020:14:27:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.21 - - [21/Apr/2020:15:27:49 +0800] "GET /2/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.22 - - [21/Apr/2020:21:27:49 +0800] "GET /3/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
...
现在需要编写shell脚本统计访问3次以上的IP，你的脚本应该输出：
6 192.168.1.22
5 192.168.1.21
4 192.168.1.20
!

awk  '{print$1}' test26.txt |sort|uniq -c|sort -nr|awk '$1>3 {print $1,$2}'