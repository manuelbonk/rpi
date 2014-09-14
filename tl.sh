#!/bin/sh

path="/srv/nfs/cam"

re='^[0-9]+$'
if ! [[ $1 =~ "$re" ]];  then
	echo -e "usage: tl.sh [interval between photos]\nor:    tl.sh [interval between photos] [output directory]"
	echo $path
	echo $1
	echo $2
	exit
fi

if [[ -z "$2"]]; then
	path="$2"
fi

echo $path

if [ ! -d "$path" ]; then
	mkdir -pv $path
fi
#while true; do
#	./raspistill -rot 180 -v -o /srv/nfs/cam/`date +"%Y-%m-%d_%H.%M.%S.jpg"`
#	sleep $1
#done

