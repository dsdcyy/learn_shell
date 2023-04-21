#!/bin/bash
# 根据用户两次输入的值进行判断，如果为整数，则再根据输入的运算符号进行数学运算
# 如果不是整数，则要求重新输入，直至正确的输入整数字符

# 定义一个函数
main() {
  read -p "Please enter a integer: " first
  check_integer $first
  [ $? -ne 0 ] && exit 1
  read -p "Please enter a integer: " two
  check_integer $two
  [ $? -ne 0 ] && exit 1
  read -p "Please enter a operator(+,-,*,/): " operator
  echo "You entered  a operator: $operator"
  # shellcheck disable=SC1072
  # shellcheck disable=SC1073
  if  [ "$operator" = "+" -o "$operator" = "-" -o "$operator" = "*" -o "$operator" = "/" ] ; then
    echo "${first} ${operator} ${two} = $((${first}${operator}${two}))"
  else
    echo "$operator is invalid!"
  fi

}



check_integer() {
  if [ ! -n "$(echo $1 | sed 's/[0-9]//g')" ]; then
    echo "You entered $1"
  else
    echo "You entered an invalid integer: $1"
    # 返回状态码
    exit 1
  fi
}

# 执行函数
main
