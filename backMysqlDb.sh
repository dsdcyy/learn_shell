#!/bin/bash
# 备份目录
BACKUP=~/mysqldb_bak

#当前时间
DATETIME=$(date +%Y-%m-%d_%H_%M_%S)

# 数据库主机
DB_HOST=localhost

# 用户名
DB_USER=root

# 数据库密码
DB_PASSWORD=12344321

# 备份的数据库名
DATABASE=tedu_note

# 创建备份目录
if [ ! -d "$BACKUP/$DATETIME" ]
then
    mkdir -p "$BACKUP/$DATETIME"
fi

# or [ ! -d "$BACKUP/$DATETIME" ] && mkdir -p "$BACKUP/$DATETIME"

# 存放gz目录
ROOT="$BACKUP/$DATETIME"

# 文件名
FILE="$ROOT/$DATETIME.sql.gz"

# 备份数据库
mysqldump -u$DB_USER -p$DB_PASSWORD --host=$DB_HOST -q -R --databases $DATABASE | gzip > $FILE

# 进入到备份文件夹操作，否则无法正常使用tar
cd "$BACKUP"

# 判断$FILE是否存在，存在则进行tar压缩
[ -f "$FILE" ] && tar -zcvf "$DATETIME.tar.gz" "$DATETIME"

# 判断压缩包是否存在，存在则将$DATETIME文件夹删除
[ -f "$DATETIME.tar.gz" ] && rm -rf "$DATETIME"

# 检查备份目录下是否有10天前的备份

find "$BACKUP" -atime +10 -name "*.tar.gz"  |xargs rm -rf

# 超过10分钟修改过的文件
# find "$BACKUP" -mmin +10 -name "*.tar.gz"  |xargs rm -rf

echo "备份数据库（$DATABASE）成功..."
