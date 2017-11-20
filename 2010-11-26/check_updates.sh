#!/bin/bash
#cron script for installing updates, should work :-)

if [ -f /tmp/updates_ready ]; then
	cd /tmp
	for i in *.upd; do
		if [ -f $i ]; then
			mkdir $i.out
			cd $i.out
			gunzip -f -c /tmp/$i > $i.tar
			tar xf $i.tar
			gunzip -f -c package.tar.gz > package.tar
			cd /
			tar xf /tmp/$i.out/package.tar
			/tmp/$i.out/update.sh
			if [ $? -eq 0 ]; then
				rm -rf /tmp/$i.out
				mv /tmp/$i /tmp/$i.installed
			else
				mv /tmp/$i /tmp/$i.failed
			fi
		fi
	done
		
	rm /tmp/updates_ready
fi
