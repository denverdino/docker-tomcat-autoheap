#!/bin/bash
limit_in_bytes=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)

# If not default limit_in_bytes in cgroup
if [ "$limit_in_bytes" -ne "9223372036854771712" ]
then
	limit_in_megabytes=$(expr $limit_in_bytes \/ 1048576)
	heap_size=$(expr $limit_in_megabytes - $RESERVED_MEGABYTES)
    if [ "$heap_size" -gt "$MIN_HEAP_MEGABYTES" ]
    then
		if [ "$heap_size" -gt "$MAX_HEAP_MEGABYTES" ]
		then
			heap_size=$MAX_HEAP_MEGABYTES
		fi
		export JAVA_OPTS="-Xmx${heap_size}m $JAVA_OPTS"
		echo JAVA_OPTS=$JAVA_OPTS
	fi
fi

exec catalina.sh run
