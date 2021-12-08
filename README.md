# discord-game-bot
A very simple bot that runs on the game server allowing controls from a discord channel

## Game Bot in Action

![image](https://user-images.githubusercontent.com/53876487/142502375-61df86f2-6f03-41a3-88a0-ba3316656fd9.png)

A simple Valheim and "Poker" configuration and scripts are provided now, with more to come.

## Quick and simple install:

1. Run

```
git clone https://github.com/richard-9000/discord-game-bot
cd discord-game-bot
python3 -m venv .
pip3 install discord
```

2. Edit the poker.ini to add your API key

3. Run the poker.py

```
source bin/activate; python poker.py
```

4. Optional: set up a systemd service:

```
scripts/systemd-setup.sh poker `pwd` steam
```
Your server is now running and will restart on reboot.

## Quick and simple install:

1. To customize for a new game, you must at least make copies of two files:

```
cp poker.ini mygame.ini
cp poker.py  mygame.py
```

2.  Edit mygame.ini and change/add commands to suit your games needs.

Note that additional commands can be added to the COMMANDS section by choosing new unique key name.  Removing a command from the commands section will disable it.

```
# General options
[GAME]
gamename=mygame
apikey=<your API key here>
channels=general,fun
authorized=GameLover#2021,everyone

# Any commands not properly sanitized provide an attack surface.  Use at your own risk!
[COMMANDS]
status=ps -ef|grep mygame
start=gamescripts/mygame/start.sh
stop=gamescripts/mygame/stop.sh
update=gamescripts/mygame/update.sh
```
