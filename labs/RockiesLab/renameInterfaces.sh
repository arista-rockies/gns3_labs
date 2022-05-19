#!/usr/bin/env bash

cnt=$(ip link | egrep "eth[[:digit:]]" | wc -l)
# seq is inclusive.  decrement by one
((cnt=cnt-1))

# we are skipping the first interface which maps to management
for interface in $(seq 1 $cnt) ; do
	sudo ip link set dev eth${interface} down
	sudo ip link set dev eth${interface} name et${interface}
	sudo ip link set dev et${interface}
done

sleep 2

sudo pkill -9 Fru
sudo pkill -9 Etba
