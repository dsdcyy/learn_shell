#!/bin/bash
: <<!
描述
假设我们的日志nowcoder.txt里，内容如下
12-May-2017 10:02:22.789 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server version:Apache Tomcat/8.5.15
12-May-2017 10:02:22.813 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:May 5 2017 11:03:04 UTC
12-May-2017 10:02:22.813 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Server number:8.5.15.0
12-May-2017 10:02:22.814 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log OS Name:Windows, OS Version:10
12-May-2017 10:02:22.814 信息 [main] org.apache.catalina.startup.VersionLoggerListener.log Architecture:x86_64
现在需要你提取出对应的值，输出内容如下
serverVersion:Apache Tomcat/8.5.15
serverName:8.5.15.0
osName:Windows
osVersion:10
!
#awk -F "log " '{print $2}' test34.txt
#awk 'BEGIN{FS="[:,]"}
#  /version/
#  {print "serverVersion:" $NF}
#  /number/
#  {print "serverName:" $NF}
#  /OS/
#  {print "osName:" $(NF-2);print "osVersion:" $NF}'
#test34.txt

awk -F"[:,]+" '{switch(NR){
    case 1 : print "serverVersion:"$NF;break
    case 3 : print "serverName:"$NF;break
    case 4 : print "osName:"$(NF-2);print "osVersion:"$NF;break
    default: break;
}}' test34.txt





