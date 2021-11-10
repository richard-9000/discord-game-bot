from genericbot import genericbot
client = genericbot.GenericBot("poker.ini")
client.run(client.config['GAME']['apikey'])
