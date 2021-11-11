#!/bin/bash

# Is server_running
ps -ef|grep valheim|grep server|grep -v root|awk '{print "Server is Running -- User: "$1" Pid: "$2" Start Time "$5" Server: "$8}'

# Is update_running
ps -ef|grep steamcmd.sh|grep force_install_dir|grep -v root|awk '{print "Update is Running -- User: "$1" Pid: "$2" Start Time "$5" SteamCmd: "$8}'
