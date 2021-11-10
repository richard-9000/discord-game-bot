import discord

# Example of running script
#client = GenericBot("poker.ini")
#client.run(client.config['GAME']['apikey'])

# # example INI file:
# [GAME]
# gamename=valheim
# apikey=<your api key>
# channels=general,fun
# authorized=everyone,CoolGuy#1234
#
# # Any commands not properly sanitized provide an attack surface.  Use at your own risk!
# [COMMANDS]
# status=ps -ef|grep poker
# save=echo "save not yet implemented"
# start=echo "save not yet implemented"
# stop=echo "save not yet implemented"

class GenericBot(discord.Client):
    config = []
    channels = { "general" : True }
    gamename = "poker"
    commands = { }

    def __init__(self, inifile):
      import configparser
      self.config = configparser.ConfigParser()
      self.config.read(inifile)
      self.channels = { c:True for c in self.config['GAME']['channels'].split(",") }
      self.authorized = { c:True for c in self.config['GAME']['authorized'].split(",") }
      self.gamename = self.config['GAME']['gamename']
      self.commands = dict(self.config.items('COMMANDS'))
      print([self.commands])
      super().__init__()

    async def on_ready(self):
      print('Logged on as {0}!'.format(self.user))

    async def on_message(self, message):
      channel = message.channel
      if (message.channel.name in self.channels):
        if (message.author in self.authorized or "everyone" in self.authorized):
          await self.on_authorized_message(message)

    async def on_authorized_message(self, message):
      channel = message.channel
      print('Message from {0.author}: {0.content} - "{0.channel.name}"'.format(message))

      # Help
      if (message.content.startswith('!help')):
        resp = "Here are a list of my commands: {0.author}".format(message) + "\n\n"
        resp += "!ping\n!help\n"
        for cmd in self.commands:
          resp += "!"+self.gamename+"-"+cmd+"\n"
        await channel.send(resp)

      # Game specific commands
      elif (message.content.startswith('!'+self.gamename+'-')):
        reqcmd = message.content.replace('!'+self.gamename+'-', "", 1)

        # Basic ping/pong
        if (reqcmd == "ping"):
          await channel.send('Pong {0.author}'.format(message))

        # Commands from ini
        elif (reqcmd in self.commands):
          resp = self.run_cmd(self.commands[reqcmd])
          if resp == "":
            await channel.send("The command {.content} returned no result".format(message))
          else:
            await channel.send("Command {.content}\n".format(message)+resp)
      

    def run_cmd(self, cmd):
      import subprocess
      p = subprocess.Popen(["/bin/sh", "-c", cmd], stdout=subprocess.PIPE)
      resp = ''
      for line in p.stdout:
          resp += line.decode("utf-8")
      p.wait()
      return resp

