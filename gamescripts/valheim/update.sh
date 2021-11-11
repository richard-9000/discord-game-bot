#!/bin/bash

isrunning=`ps -ef|grep valheim|grep server|grep -v root|awk '{ print " Pid: "$2" Start Time "$5" Server: "$8}'`
if [ "$isrunning" != "" ]; then
  echo "The server is still running, please stop before running update: $isrunning" 
  exit 1
fi

( 
  cd /home/steam/steamcmd && \
    ./steamcmd.sh +login anonymous +force_install_dir /home/steam/ValheimPlus/ +app_update 896660 validate +exit >/dev/null &
  disown 
) >/dev/null

echo "Valheim update started, use !valheim-status for progress."
