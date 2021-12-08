#!/bin/bash

isrunning=`ps -ef|grep 7Days|grep server|grep -v root|awk '{ print " Pid: "$2" Start Time "$5" Server: "$8}'`
if [ "$isrunning" != "" ]; then
  echo "The server is already running: $isrunning" 
  exit 1
fi

( 
  cd /home/steam/steamcmd/7daysded && nohup ./startserver.sh configfile=serverconfig.xml >/dev/null & 
  disown 
) >/dev/null; 

echo "7 Days Server has been started: use !7days-status for progress."