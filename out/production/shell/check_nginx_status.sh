#!/bin/bash
# 检测nginx任务状态
# 检测url是否有效
CheckUrl() {
  # 确定连接超时时间
  timeout=5
  # 失败的次数
  fail=0
  success=0
  Total_times=3
  fine=$(echo "$Total_times*0.9" | bc)
  general=$(echo "$Total_times*0.6" | bc)
  # shellcheck disable=SC2107
  while [ $Total_times -ge 0 ]; do
    # --timeout 超时时间
    # --tries 重试次数
    # -q 静默运行，不显示信息
    # -O 输出到
    proxychains wget "https://www.huya.com" --timeout=$timeout --tries=1 -q -O /dev/null
    let Total_times--
    # 判断执行是否成功  # 成功执行，success+1
    [ $? -eq 0 ] && success=$((success + 1)) || fail=$((fail + 1))
  done
  echo "Success: $success, Failed: $((fail - 1))"
  if [ $(echo "$success>=$fine" | bc) -eq 1 ]; then
    echo "该网站连接状态非常稳定..."
  elif [ $(echo "$success>=$general" | bc) -eq 1 ]; then
    echo "该网站连接状态良好，有些许波动..."
  elif [ $success -eq 0 ]; then
    echo "该网站无法连接..."
  else
    echo "该网站连接状态不稳定,波动较大..."
  fi

  exit 0

}

CheckUrl
