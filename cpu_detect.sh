#!/bin/sh

###循环采集cpu和mem信息

while true
do
	info=$(top -n 1 | grep -E -i 'CPU|MEM' | head -n 2)
	
	idleValue=$(echo $info | awk '{print $19}' | cut -d "%" -f 1)
	
	if [ $idleValue -lt 20 ];then
	echo "HIGH CPU TOP INFO #######" >>/overlay/cpu_info.txt
	top -n 1 >>/overlay/cpu_info.txt
	fi
	echo $info $(date) >>/overlay/cpu_info.txt
	#echo $(top -n 1 | grep -E -i 'CPU|MEM' | head -n 2) $(date) >> cpu_info.txt
	
	sleep 3
done
