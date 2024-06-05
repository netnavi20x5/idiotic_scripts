#ngrok_telegram.py
import time
import datetime
import requests
import configparser
import subprocess
import os

config = configparser.ConfigParser()
config.read('/home/faridil/config/telegram.conf')
config.sections()
config["telegram_RedNavi_bot"]['bot_token']

def telegram_bot_sendtext(bot_message):
    bot_token = config["telegram_RedNavi_bot"]['bot_token']
    bot_chatID = config["telegram_RedNavi_bot"]['bot_chatID']
    send_text = 'https://api.telegram.org/bot' + bot_token + '/sendMessage?chat_id=' + bot_chatID + '&parse_mode=Markdown&text=' + bot_message
    response = requests.get(send_text)
    return response.json()

##telegram_bot_sendtext("test")
#command = "systemctl status ngrok|grep tcp|grep 22"
command = "echo $(hostname) $(systemctl status ngrok|grep tcp|grep 22)"
result = os.popen(command).read()
print (len(result))
if (len (result) <=10):
  print ("blank")
else:
  print ("not blank")
  output= [result.split()[0],result.split()[-1]]
  print (" ".join(output))
  telegram_bot_sendtext (" ".join(output))
