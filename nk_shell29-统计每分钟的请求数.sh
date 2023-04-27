#!/bin/bash
: <<!
描述
假设nginx的日志存储在nowcoder.txt里，内容如下：
192.168.1.20 - - [21/Apr/2020:14:12:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.21 - - [21/Apr/2020:15:00:49 +0800] "GET /2/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.22 - - [21/Apr/2020:21:21:49 +0800] "GET /3/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
...
现在需要编写shell脚本统计每分钟的请求数，并且按照请求数降序排序。你的脚本应该输出：
5 20:27
4 15:00
2 22:10
...

!

awk -F ":" '{print $2":"$3}' test29.txt|sort|uniq -c|sort -r|awk '{print $1,$2}'
