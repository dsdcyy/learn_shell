#!/bin/bash
: <<!
描述
假设有一些域名，存储在nowcoder.txt里，现在需要写一个shell脚本，将域名取出并根据域名进行计数排序处理（降序）。
假设nowcoder.txt内容如下：
http://www.nowcoder.com/index.html
http://www.nowcoder.com/1.html
http://m.nowcoder.com/index.html
你的脚本应该输出：
2 www.nowcoder.com
1 m.nowcoder.com
!

awk -F "/" '{print$3}' 'test18.txt'|sort -r|uniq -c|awk '{print $1" "$2}'
