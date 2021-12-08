#!/bin/bash

serverpid=`ps -ef|grep 7DaysToDieServer.x86_64|grep -v grep|awk '{print $2}'`

echo -e 'say "Saving World, server will shutdown in 10 seconds"\nexit' | nc localhost 8081
echo -e 'saveworld\nexit' | nc localhost 8081
sleep 10
kill "$serverpid"

echo "Kill sent to Server Process $serverpid"
