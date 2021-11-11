#!/bin/bash

isrunning=`ps -ef|grep valheim|grep server|grep -v root|awk '{ print " Pid: "$2" Start Time "$5" Server: "$8}'`
if [ "$isrunning" != "" ]; then
  echo "The server is already running: $isrunning" 
  exit 1
fi

( 
  cd /home/steam/ValheimPlus && nohup ./start_server_bepinex.sh steamcmd update.sh >/dev/null & 
  disown 
) >/dev/null; 

echo "Valheim server has been started: use !valheim-status for progress."
