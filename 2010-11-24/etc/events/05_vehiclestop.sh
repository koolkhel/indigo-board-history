#!/bin/bash
. /etc/sysvars
echo ".timeout 5000
insert into event (id, event_code, event_time, sent) values (NULL, 51, current_timestamp, 0);" | sqlite3 $DATABASE
