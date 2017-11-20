#!/bin/bash
. /etc/sysvars
echo ".timeout 60000
insert into event (id, event_code, event_time, sent) values (NULL, 42, current_timestamp, 0);" | sqlite3 $DATABASE/events.db
