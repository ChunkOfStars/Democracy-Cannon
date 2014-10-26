#!/bin/bash
echo "Launching t authorization to link your twitter account to the Democracy Cannon"
t authorize
##grab last tweet ID file from server
echo 'Initial last tweet ID pulled from server'
wget --https-only https://www.site.com/lastreadtweetid.txt
exit 0
