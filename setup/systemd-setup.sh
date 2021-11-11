#!/bin/sh

die_usage() {
echo <<EOF
Usage: systemd-setup.sh <gamename> <gamedir> <user>

  ex:
  systemd-setup.sh valheim /home/steam/valheim steam
EOF
  exit 1
}

gamename="$1"
gamedir="$2"
user="$3"
[ "$gamename" == "" ] || [ "$gamedir" == "" ]  || [ "$user" == "" ] || die_usage

(
echo <<EOF
[Unit]
Description=Discord Game Bot - $gamedir
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=$user
ExecStart=/usr/bin/env python3 "$gamedir/discordbot/$gamename.py"

[Install]
WantedBy=multi-user.target
EOF
) > "/etc/systemd/system/discordbot-$gamename.service"

systemctl enable "discordbot-$gamename"
systemctl start  "discordbot-$gamename"
