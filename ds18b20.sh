#!/bin/bash

case "$1" in
	0) TEMP=`cat /sys/bus/w1/devices/28-000005204000/w1_slave | grep "t="`
		;;
	1) TEMP=`cat /sys/bus/w1/devices/28-000005216168/w1_slave | grep "t="`
		;;
	2) TEMP=`cat /sys/bus/w1/devices/28-00000520d25b/w1_slave | grep "t="`
		;;
	3) TEMP=`cat /sys/bus/w1/devices/28-000005215fb2/w1_slave | grep "t="`
		;;
	4) TEMP=`cat /sys/bus/w1/devices/28-0000052092bd/w1_slave | grep "t="`
		;;
	5) TEMP=`cat /sys/bus/w1/devices/28-00000520c134/w1_slave | grep "t="`
		;;
	6) TEMP=`cat /sys/bus/w1/devices/28-000005204b27/w1_slave | grep "t="`
		;;
	7) TEMP=`cat /sys/bus/w1/devices/28-00000520d30e/w1_slave | grep "t="`
		;;
	8) TEMP=`cat /sys/bus/w1/devices/28-000005215256/w1_slave | grep "t="`
		;;
	9) TEMP=`cat /sys/bus/w1/devices/28-0000052123ee/w1_slave | grep "t="`
		;;
	*) echo "sensor $1 not available"
		;;
esac
TEMP=`echo $TEMP | sed -e 's/.*t=//g'`
OUT=${TEMP:0:2}.${TEMP:2:1}
echo -e $OUT"°C"
echo -e `date +%Y-%m-%d' '%H':'%M':'%S` $OUT>>/home/m/dev/ds18b20/temp.log
# echo -ne ${TEMP:0:2}.${TEMP:2:1}"\n"
