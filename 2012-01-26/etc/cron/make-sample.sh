#!/bin/bash
time=`date +%F`
rm -f /tmp/current_sample.gz /tmp/current_time.gz

/etc/init.d/S97people stop
killall relay

cat /opt/debug-sample.txt | gzip - > /tmp/sample-$time.gz
cat /opt/debug-time.logfile | gzip - > /tmp/time-$time.gz

rm /opt/debug-time.logfile
rm /opt/debug-sample.txt

ln -s /tmp/sample-$time.gz /tmp/current_sample.gz
ln -s /tmp/time-$time.gz /tmp/current_time.gz

/opt/relay &
/etc/init.d/S97people start
