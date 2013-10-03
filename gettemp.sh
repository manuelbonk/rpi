#!/bin/bash

TEMP1=`cat /sys/bus/w1/devices/28-000005204000/w1_slave | grep "t="`
TEMP2=`cat /sys/bus/w1/devices/28-000005216168/w1_slave | grep "t="`
TEMP3=`cat /sys/bus/w1/devices/28-00000520d25b/w1_slave | grep "t="`
TEMP4=`cat /sys/bus/w1/devices/28-000005215fb2/w1_slave | grep "t="`

echo "`date +%Y-%m-%d_%H:%M` temp1: $TEMP1" >>/var/log/temp.log
echo "`date +%Y-%m-%d_%H:%M` temp2: $TEMP2" >>/var/log/temp.log
echo "`date +%Y-%m-%d_%H:%M` temp3: $TEMP3" >>/var/log/temp.log
echo "`date +%Y-%m-%d_%H:%M` temp4: $TEMP4" >>/var/log/temp.log
