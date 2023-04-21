# 备份某个数据库
mysqldump -uroot -p atguigudb1 > 'atguigudb1.sql'
# 备份多个数据库
mysqldump -uroot -p --databases atguigudb1 bookdb > 'part_databases.sql'
# 备份全部数据库
mysqldump -uroot -p --all-databases > 'all_databases.sql'
# 备份部分表 class user1 多个表
mysqldump -uroot -p  atguigudb1 class user1 > 'atguigudb1_c_u.sql'
# 备份单表部分数据
mysqldump -uroot -p  atguigudb1 class --where='id<15' > 'atguigudb1_c_u.sql'
# 排除备份数据库的某张表
mysqldump -uroot -p atguigudb1 class --ignore-table=atguigudb1.class > 'atguigudb1_no_class.sql'
# 只备份表结构
mysqldump -uroot -p atguigudb1  --no-data > 'atguigudb1_no_data.sql'
mysqldump -uroot -p atguigudb1  --d > 'atguigudb1_no_data.sql'
# 只备份数据
mysqldump -uroot -p atguigudb1  --no-create-info > 'atguigudb1_no_data.sql'
mysqldump -uroot -p atguigudb1  -t > 'atguigudb1_no_sql.sql'
# 备份包含存储过程，函数，事件
mysqldump -uroot -p -R -E --databases atguigudb1  -t > 'atguigudb1_pro.sql'

# 恢复数据 指定数据库< 备份文件
mysql -uroot -p atguigudb1 < 'atguigudb1.sql'
# 全量备份
mysql -uroot -p < 'all_databases.sql'
# 从全量备份中恢复单库
sed -n '/^-- Current Database: `atguigudb1`/,/^-- Current Database: `/p' all_database.sql > atguigu.sql
# 从单库备份中恢复单表

cat atguigudb1.sql | sed -e '/./{H;$!d;}' -e 'x;/CREATE TABLE `class`/!d;q' > class_structure.sql
cat atguigudb1.sql | grep --ignore-case 'insert into `class`' > class_data.sql

# mysql内部恢复
source 'atguigudb1.sql';

# 使用物理复制磁盘数据时需给对应文件权限
chown -R mysql.mysql /var/lib/mysql/dbname

# mysql导出数据
# 首先查看安全导出的文件夹在哪
# mysql命令
show variables like '%secure%';
# 导出
select * from user1 into outfile '/var/lib/mysql-files/user1.sql';
# 使用mysqldump
mysqldump -uroot -p -T "/var/lib/mysql-files" atguigudb1 user1
# ：使用mysqldump将atguigu数据库中的account表导出到文本文件，使用FIELDS选项，要求字段之
# 间使用逗号“，”间隔，所有字符类型字段值用双引号括起来
mysqldump -uroot -p -T "/var/lib/mysql-files/" atguigu account --fields-terminated- by=','
--fields-optionally-enclosed-by='\"'
# 使用mysql
mysql -uroot -p -e "select * from user1;" atguigudb1 > '/var/lib/mysql-files/user1.sql'
# 将atguigu数据库account表中的记录导出到文本文件，使用--veritcal参数将该条件记录分为多行显示
mysql -uroot -p --vertical --execute="SELECT * FROM account;" atguigu > "/var/lib/mysql-files/account_1.txt"
# 将atguigu数据库account表中的记录导出到xml文件，使用--xml参数
mysql -uroot -p --xml --execute="SELECT * FROM account;" atguigu>"/var/lib/mysqlfiles/account_3.xml"

# 从文本文件account.txt中恢复数据
LOAD DATA INFILE '/var/lib/mysql-files/account_0.txt' INTO TABLE atguigu.account