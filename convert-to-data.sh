cat log | xargs -L 1 date -j -f "%d.%m.%YN%H:%M:%S" +"%s" | paste - people.data.txt | colrm 11 26
