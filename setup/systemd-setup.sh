#!/bin/sh

die_usage() {
cat <<EOF
Usage: systemd-setup.sh <gamename> <gamedir> <user>

  ex:
  systemd-setup.sh valheim /home/steam/valheim steam
EOF
  exit 1
}

gamename="$1"
gamedir="$2"
user="$3"
[ "$gamename" == "" ] && die_usage
[ "$gamedir" == "" ]  && die_usage
[ "$user" == "" ] && die_usage

(
cat <<EOF
[Unit]
Description=Discord Game Bot - $gamedir
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=$user
WorkingDirectory=$gamedir
ExecStart=/usr/bin/env bash -c 'source bin/activate; python "$gamedir/$gamename.py"'

[Install]
WantedBy=multi-user.target
EOF
) > "/etc/systemd/system/discordbot-$gamename.service"

systemctl enable "discordbot-$gamename"
systemctl start  "discordbot-$gamename"
