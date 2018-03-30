#!/bin/sh

who /var/run/utmp | awk '{gsub(/[\(\)]/,"")}1 {print "who,user="$1",ip="$NF" ip=\""$NF"\",online=1"}'
