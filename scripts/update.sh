#!/bin/bash

REINDEX=0
UPDATE=0
CHECK=0

if [[ -f 'tmp/index_update.pid' ]]; then
UPD_PID=`ps -p $(cat tmp/index_update.pid) -o pid=`

    if [[ -n "$UPD_PID" ]]; then
	UPDATE=1
    else
	rm -f tmp/index_update.pid
    fi
fi

if [[ -f 'tmp/index_reindex.pid'  ]]; then
REI_PID=`ps -p $(cat tmp/index_reindex.pid) -o pid=`
	if [[ -n "$REI_PID" ]]; then
		REINDEX=1
	else
		rm -f tmp/index_reindex.pid
	fi
fi

if [[ -f 'tmp/index_check.pid'  ]]; then
CHK_PID=`ps -p $(cat tmp/index_check.pid) -o pid=`
        if [[ -n "$CHK_PID" ]]; then
		CHECK=1
        else
		rm -f tmp/index_check.pid
        fi
fi

if [ "$REINDEX" -eq 1 -o "$CHECK" -eq 1 ]; then
	exit 0
else
	if [ "$UPDATE" -eq 0 ]; then
		/usr/bin/node scripts/sync.js index update > /dev/null 2>&1
	fi
fi
