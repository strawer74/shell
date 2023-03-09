#!/bin/bash
# IP=192.168.25.128
# -c是ping的次数
# 与 或
# ping -c1 "$IP" &>/dev/null && echo "ip ${IP} test ok" || echo "ip $IP error"

# ping主机是否通，IP存放在ping命名的文件中
for i in `cat ping`
do
     ping=`ping -c 1 $i | grep loss | awk '{print $6}' | awk -F "%" {'print $1'}`
     if [ $ping -eq 100 ];then
             echo ping $i fail
     else
             echo ping $i ok
     fi
done