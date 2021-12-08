#!/bin/bash

serverpid=`ps -ef|grep 7DaysToDieServer.x86_64|grep -v grep|awk '{print $2}'`
kill "$serverpid"

echo "Kill sent to Server Process $serverpid"