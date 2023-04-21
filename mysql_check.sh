#!/bin/bash
mysql_status=$(netstat -tunlp | grep mysql | wc -l)
if [ $mysql_status -gt 0 ]; then
  echo "mysql存活"
  echo "停止mysql服务..."
  systemctl stop mysql
else
  echo "mysql服务异常"
  echo "尝试重启mysql服务"
  systemctl restart mysql
  echo "mysql服务状态"
  mysql_status=$(systemctl status mysql |grep 'active (running)')
  [ -n "$mysql_status" ] && echo "运行正常" || echo "尝试重启失败"
fi
