#!/bin/bash

# 备份目录
read -p "请输入备份目录:" BACKUP_PATH

#当前时间
DATETIME=$(date +%Y-%m-%d_%H_%M_%S)

# 数据库主机
read -p "请输入主机地址:" DB_HOST

# 用户名
read -p "请输入数据库用户名:" DB_USER

# 数据库密码
read -p "请输入数据库用户密码:" DB_PASSWORD

# 备份的数据库名
read -p "请输入需要备份的数据名称:" DATABASE

# 创建备份目录
#if [ ! -d "$BACKUP_PATH/$DATETIME" ]
#then
#    mkdir -p "$BACKUP_PATH/$DATETIME"
#fi

[ ! -d "$BACKUP_PATH/$DATETIME" ] && mkdir -p "$BACKUP_PATH/$DATETIME"

# 存放gz目录
ROOT="$BACKUP_PATH/$DATETIME"

# 文件名
FILE="$ROOT/$DATETIME.sql.gz"

# 备份数据库
mysqldump -u$DB_USER -p$DB_PASSWORD --host=$DB_HOST -q -R --databases $DATABASE | gzip > $FILE

# 进入到备份文件夹操作，否则无法正常使用tar
cd "$BACKUP_PATH"

# 判断$FILE是否存在，存在则进行tar压缩
[ -f "$FILE" ] && tar -zcvf "$DATETIME.tar.gz" "$DATETIME"

# 判断压缩包是否存在，存在则将$DATETIME文件夹删除
[ -f "$DATETIME.tar.gz" ] && rm -rf "$DATETIME"

# 检查备份目录下是否有10天前的备份

find "$BACKUP_PATH" -atime +10 -name "*.tar.gz"  |xargs rm -rf

# 超过10分钟修改过的文件
# find "$BACKUP_PATH" -mmin +10 -name "*.tar.gz"  |xargs rm -rf

echo "备份数据库（$DATABASE）成功..."
