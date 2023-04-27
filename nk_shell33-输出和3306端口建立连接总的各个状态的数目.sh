#!/bin/bash
: <<!
描述
假设netstat命令运行的结果我们存储在nowcoder.txt里，格式如下：
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:6160            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
...
现在需要你输出和本机3306端口建立连接的各个状态的数目，按照以下格式输出
TOTAL_IP表示建立连接的ip数目
TOTAL_LINK表示建立连接的总数目
TOTAL_IP 3
ESTABLISHED 20
TOTAL_LINK 20
!
#TOTAL_IP=$(awk  '/3306/ && /tcp/ {print $(NF-1)}' test33.txt|cut -d ':' -f 1 |sort|uniq -c|wc -l)
#ESTABLISHED=$(awk  '/3306/ && /tcp/ && /ESTABLISHED/' test33.txt|wc -l)
#TOTAL_LINK=$(awk  '/3306/ && /tcp/' test33.txt|wc -l)
#echo "TOTAL_IP $TOTAL_IP"
#echo "ESTABLISHED $ESTABLISHED"
#echo "TOTAL_LINK $TOTAL_LINK"
awk '
BEGIN{
    PROCINFO["sorted_in"]="@val_num_asc"
}
$5 ~ /3306/ {
    ip_set[$5]=1;
    a[$6]++;
    cnt++;
}
END{
    print "TOTAL_IP", length(ip_set);
    for(x in a){ print x, a[x] };
    print "TOTAL_LINK", cnt
}' test33.txt



