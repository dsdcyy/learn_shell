[ $# -ne 2 ] && {  # 判断传入的参数是否为2个
    echo "must be two args"
    exit 119 # 返回值，可以被下个命令的$i锁获取
    }
echo "没毛病,就是两个参数..."