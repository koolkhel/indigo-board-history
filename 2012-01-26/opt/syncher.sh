#!/bin/bash
if [ -f /tmp/syncher.pid ]; then
	echo Already running
	exit 1;
fi
cd /
echo $$ > /tmp/syncher.pid
function myexit {
	rm -f /tmp/syncher.pid
	exit 0
}
trap myexit SIGTERM
while true; do
	sync
	sleep 10
done;
