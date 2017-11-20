set net:timeout 30
set net:reconnect-interval-multiplier 1
open 10.1.0.26
user root 123123
cd /opt
get -c logs.tar.gz
