# discord-game-bot
A very simple bot to control games from a discord channel

## Quick and simple install:

1. Run

```
git clone https://github.com/richard-9000/discord-game-bot
cd discord-game-bot
python3 -m venv .
```

2. Edit the poker.ini to add your API key

3. Run the poker.py

```
source bin/activate; python poker.py
```

4. Optional: set up a systemd service:

```
source bin/activate; python poker.py
scripts/systemd-setup.sh poker `pwd` steam
```
