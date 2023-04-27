#!/bin/bash
: <<!
描述
假设 Nginx 的日志存储在 nowcoder.txt 里，内容如下：
192.168.1.20 - - [21/Apr/2020:14:27:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.21 - - [21/Apr/2020:15:27:49 +0800] "GET /2/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.22 - - [21/Apr/2020:21:27:49 +0800] "GET /3/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
192.168.1.23 - - [21/Apr/2020:22:27:49 +0800] "GET /1/index.php HTTP/1.1" 404 490 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:45.0) Gecko/20100101 Firefox/45.0"
...
现在需要编写 Shell 脚本统计 2020年04月23日20点至23点去重后的 IP 访问量，你的脚本应该输出：
5
输出说明：2020年04月23日20点至23点，共有 192.168.1.24、192.168.1.25、192.168.1.20、192.168.1.21、192.168.1.22 共 5 个 IP 访问了。
!

sed -n '/23\/Apr\/2020:20/,/23\/Apr\/2020:22/p' test25.txt|awk '{print $1}'|uniq|wc -l