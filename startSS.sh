#!/bin/bash
scriptName="sslocal"
ConfPath=`pwd`
Conf="${ConfPath}/example.json"
PID=`ps -ef | grep ${scriptName} | grep -v grep |awk '{print $2}'`
if [ -n "$PID" ]; then
	echo "kill -9 $scriptName"
	kill -9 ${PID}
fi
echo "$scriptName -c $Conf 2>&1 | tee ${ConfPath}/sslocal.log &"
${scriptName} "-c" ${Conf} 2>&1 | tee ${ConfPath}/sslocal.log &
