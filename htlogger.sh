#!/bin/bash

if [[ "$(id -u)" != "0" ]]; then
	echo "This script has to be run by root!" 1>&2
	exit 1
fi


echo -e $(date +%Y-%m-%d' '%H':'%M)" "$(/home/m/dev/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT 2302 4 | grep Temp) >> /var/log/ht.log
