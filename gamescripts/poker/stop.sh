#!/bin/bash

serverpid=`ps -ef|grep poker_server.x86_64|grep -v grep|awk '{print $2}'`
kill "$serverpid"

echo "Kill sent to Server Process $serverpid"
