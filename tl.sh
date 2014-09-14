#!/bin/sh

path="/srv/nfs/cam"

re='^[0-9]+$'
if  ! [[ $1 =~ "$re" ]];  then
	echo -e "usage: tl.sh [interval between photos]\n   or: tl.sh [interval between photos] [output directory]"
	exit
fi

if ! [[ -z "$2" ]]; then
	path=$2
fi

mkdir $path

while true; do
	./raspistill -rot 180 -v -o $path/`date +"%Y-%m-%d_%H.%M.%S.jpg"`
	sleep $1
done
