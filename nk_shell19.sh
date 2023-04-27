#!/bin/bash
: <<!
描述
编写一个shell脚本，输入正整数n，打印边长为n的等腰三角形。
示例：
输入：5
输出：
    *
   * *
  * * *
 * * * *
* * * * *
!
read -p "请输入一个数字：" p
awk -v p=$p 'BEGIN{
    for(n = 1; n <= p; n++){
        row = "";
        for(i = 1;i <= p - n; i++){
            row = row " "
        }
        for(i = 1; i <= n; i++){
            row = row "*" " "
        }
        print row
    }
}'
