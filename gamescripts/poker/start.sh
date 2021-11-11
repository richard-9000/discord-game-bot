#!/bin/bash

isrunning=`ps -ef|grep poker|grep server|grep -v root|awk '{ print " Pid: "$2" Start Time "$5" Server: "$8}'`
if [ "$isrunning" != "" ]; then
  echo "The server is already running: $isrunning" 
  exit 1
fi

( 
  cd /home/steam/PokerPlus && nohup ./start_server_bepinex.sh steamcmd update.sh >/dev/null & 
  disown 
) >/dev/null; 

echo "Poker server has been started: use !poker-status for progress."
