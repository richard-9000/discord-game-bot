#!/bin/bash

isrunning=`ps -ef|grep 7Days|grep server|grep -v root|awk '{ print " Pid: "$2" Start Time "$5" Server: "$8}'`
if [ "$isrunning" != "" ]; then
  echo "The server is still running, please stop before running update: $isrunning" 
  exit 1
fi

( 
  cd /home/steam/steamcmd && \
    ./steamcmd.sh +force_install_dir ./7daysded +login anonymous app_update 294420 -beta latest_experimental validate +exit >/dev/null &
  disown 
) >/dev/null

echo "7Days update started, use !7Days-status for progress."