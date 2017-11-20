#!/bin/bash
# sensor is turned off after being on for too long
# $1 is sensor number in range [0..3]. It is transformed to range [1..4].
. /etc/sysvars
let y=$1+1
echo ".timeout 5000
insert into event (id, event_code, event_time, sent) values (NULL, 1$y, current_timestamp, 0);" | sqlite3 $DATABASE 
