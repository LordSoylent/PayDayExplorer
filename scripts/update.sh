#!/bin/bash
if [[ -f '/root/explorer/tmp/index.pid' ]]; then
    rm /root/explorer/tmp/index.pid
fi
/usr/bin/node /root/explorer/scripts/sync.js index update
