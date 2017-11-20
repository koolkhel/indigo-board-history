#!/bin/bash

# simple map implementaton

hput() {
    eval "$1""$2"='$3'
}

hget() {
    eval echo '${'"$1$2"'#hash}'
}

# milliseconds
hput delay 0 50
hput delay 50 100
hput delay 100 150
hput delay 150 200
hput delay 200 300
hput delay 300 400
hput delay 400 500
hput delay 500 600
hput delay 600 700
hput delay 700 800
hput delay 800 900

# find, what's current value of delay
current_delay=0
if [ -f /tmp/sensor_delay_value ]; then
    current_delay=`cat /tmp/sensor_delay_value`
fi

# find next value of delay

next_delay=`hget delay $current_delay`
if [ -z $next_delay ]; then
    # no entry in delay map
    let next_delay=$current_delay+100
fi
echo $next_delay

# apply new delay thorough sysfs

# nanoseconds
let delayval=$next_delay*1000*1000

echo $delayval > /sys/module/piopins/parameters/delay1
echo $delayval > /sys/module/piopins/parameters/delay2

echo `date` $next_delay >> /opt/delay.log

# save tmp data for next call

echo $next_delay > /tmp/sensor_delay_value

