#!/usr/bin/python
from bottle import route, run

# Import required libraries
import time
import RPi.GPIO as GPIO

# Define some settings
# Wait for one second
WaitTime = 1.0
# Use BCM GPIO references
# instead of physical pin numbers
GPIO.setmode(GPIO.BCM)

# Define GPIO signals to use
# and the Mapping to Signals A-D and ON/OFF
Pins={ 'A': 14, 'B':15, 'C':18, 'D':25, 'ON': 24, 'OFF':23 }

# Set all pins as output
for pin in Pins:
  GPIO.setup(Pins[pin],GPIO.OUT)
  GPIO.output(Pins[pin], False)

# Switches "switch" to ON or OFF state
# Parameters are "switch" (A,B,C,D) and "state" (ON,OFF)
def setSwitch(switch, state):
  GPIO.output(Pins[switch], True)
  GPIO.output(Pins[state], True)
  time.sleep(WaitTime)
  GPIO.output(Pins[switch], False)
  GPIO.output(Pins[state], False)

@route('/switch/<name>/<pos>')
def index(name, pos):
  name = name.upper()
  pos = pos.upper()
  setSwitch(name, pos)
  return 'Switch %s %s</b>' % (name, pos)

# run(host='0.0.0.0', port=80)

@route ('/')
def index ():
    output = open ('/opt/switch/index.html')
    return output

@route ('/apple-touch-icon.png')
def index ():
    output = open ('/opt/switch/apple-touch-icon.png')
    return output

run (host='0.0.0.0', port=80)
