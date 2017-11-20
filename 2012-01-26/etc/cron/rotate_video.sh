#!/bin/bash

# тема стоит следующая:
# есть каталог adfsf/video, в котором находятся:
# папки вида ГГГГ-ММ-ДД-ЧЧ (много)
# вав файлы, которые по порядку обязаны совпадать с папками

# надо:
# при количестве папок и вавок больше, чем константа, удалить
# лексографически первые (то есть, самые старые)

# мы убеждены, что файлы и каталоги в $VIDEO будучи сортированными по имени
# дают исторический порядок

# $VIDEO == папка, где лежат видеофайлы. предполагается /mnt/mmcblk0p1
# $VIDEO_HOURS == сколько часов мы оставляем, считая, что в каждой папке
# лежит по часу

. /etc/sysvars

if [ -f /tmp/rotating ]; then
    logger "rotating already started"
    exit 1
fi

touch /tmp/rotating

flash_status.sh
if [ $? -eq 0 ]; then
    logger "rotating video"
    dircurcount=`find $VIDEO/ -mindepth 1 -maxdepth 1 -type d | wc -l`
    if [ ! -z $dircurcount ]; then
	if [ $dircurcount -gt $VIDEO_HOURS ]; then
	    let diff=$dircurcount-$VIDEO_HOURS;
	    find $VIDEO/ -maxdepth 1 -mindepth 1 -type d | sort -n | head -n $diff | xargs rm -rf
	fi;
    fi
    wavcurcount=`find $VIDEO/ -mindepth 1 -maxdepth 1 -type f -name "*.wav" | wc -l`
    if [ ! -z $wavcurcount ]; then
	if [ $wavcurcount -gt $VIDEO_HOURS ]; then
	    let diff=$wavcurcount-$VIDEO_HOURS;
	    find $VIDEO/ -mindepth 1 -maxdepth 1 -type f -name "*.wav" | sort -n | head -n $diff | xargs rm -rf
	fi;
    fi;
else
	logger "no flash drive to rotate video on"
fi

rm -f /tmp/rotating