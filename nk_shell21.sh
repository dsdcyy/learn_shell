#!/bin/bash
: <<!
描述
有一个文件nowcoder.txt，里面的每一行都是一个数字串，编写一个shell脚本对文件中每一行的数字串进行格式化：每3个数字加入一个逗号（,）。
例如：数字串为“123456789”，那么需要格式化为123,456,789。

假设nowcoder.txt内容如下：
1
12
123
1234
123456
那么你的脚本输出如下：
1
12
123
1,234
123,456
!
awk 'BEGIN{FS=""}
{
  for(i=1;i<=NF;i++)
{
  if((NF-i)%3==0&&i!=NF)
  printf $i",";else printf $i
};
  printf "\n"
}' test21.txt
