#!/bin/bash
: <<!
描述
编写一个shell脚本以输出一个文本文件nowcoder.txt中的行数
示例:
假设 nowcoder.txt 内容如下：
#include <iostream>
using namespace std;
int main()
{
    int a = 10;
    int b = 100;
    cout << "a + b:" << a + b << endl;
    return 0;
}
你的脚本应当输出：
9
!
cat test23.txt | wc -l
