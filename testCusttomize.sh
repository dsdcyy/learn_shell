# 自定义函数
function get_sum()
{
    S=$[$n1+$n2]
    echo "sum is $S"
}

# 输入两个值
read -p "请输入一个数n1: " n1
read -p "请输入一个数n2: " n2

# 调用
get_sum $n1 $n2