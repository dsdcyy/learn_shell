#!/bin/bash
: <<!
编写一个shell脚本，将文件nowcoder.txt中每一行的字段逆序输出，其中字段之间使用英文冒号:相分隔。
假设nowcoder.txt内容如下：
nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
root:*:0:0:System Administrator:/var/root:/bin/sh
你的脚本应当输出
/usr/bin/false:/var/empty:Unprivileged User:-2:-2:*:nobody
/bin/sh:/var/root:System Administrator:0:0:*:root
!

awk 'BEGIN{FS=":"}{for(i=NF;i>1;i--){printf "%s:",$i}}{print $1}' test17.txt