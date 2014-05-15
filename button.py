#!/usr/bin/python
from bottle import route, run, get

# Import required libraries
import time
import RPi.GPIO as GPIO

# press button n for seconds
WaitTime = 1.0

# Use BCM GPIO references
# instead of physical pin numbers
GPIO.setmode(GPIO.BCM)

GPIO.setup(25,GPIO.OUT)
GPIO.output(25, False)

def pressButton():
  GPIO.output(25, True)
  time.sleep(WaitTime)
  GPIO.output(25, False)

@route ('/led/press')
def index ():
    pressButton()
    return 'button pressed'

run (host='0.0.0.0', port=1337)
