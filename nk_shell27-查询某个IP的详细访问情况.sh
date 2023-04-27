#!/bin/bash
: <<!
描述
假设nginx的日志存储在nowcoder.txt里，内容如下：
192.168.1.20 - - [21/Apr/2020:14:27:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.21 - - [21/Apr/2020:15:27:49 +0800] "GET /2/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.22 - - [21/Apr/2020:21:27:49 +0800] "GET /3/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
...
现在需要编写shell脚本查询192.168.1.22的详细访问次数情况，按访问频率降序排序。你的脚本应该输出：
4 /1/index.php
2 /3/index.php
!

grep '192.168.1.22' test27.txt | awk -F " " '{print $7}' |sort |uniq -c | sort -r|awk '{print $1,$2}'