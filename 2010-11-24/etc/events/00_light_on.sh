#!/bin/bash
# sensor is turned on for too long
# $1 is sensor number in range [0..3]. it is transformed to [1..4] range
. /etc/sysvars
let y=$1+1
echo ".timeout 5000
insert into event (id, event_code, event_time, sent) values (NULL, $y, current_timestamp, 0);" | sqlite3 $DATABASE 
