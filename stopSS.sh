#!/bin/bash
scriptName="sslocal"
PID=`ps -ef | grep ${scriptName} | grep -v grep |awk '{print $2}'`
if [ -n "$PID" ]; then
	echo "kill -9 $scriptName"
        kill -9 ${PID}
fi

