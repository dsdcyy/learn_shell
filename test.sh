#!/bin/bash
# -e 测试文件是否存在
# && 存在进行的动作
# || 不存在进行的动作
test -e 123.txt && echo "存在" || echo "不存在";touch 123.txt