#!/usr/bin/python
# Import the libraries to use time delays, send os commands and access GPIO pins
import RPi.GPIO as GPIO
import time
import os

i=0
GPIO.setmode(GPIO.BOARD) # Set pin numbering to board numbering
GPIO.setup(7, GPIO.IN) # Setup pin 7 as an input
while True: # Setup a while loop to wait for a button press
	if(GPIO.input(7)): # Setup an if loop to run a shutdown command when button press sensed
		print ('SHUTTING DOWN!')
#		os.system("sudo shutdown -h now") # Send shutdown command to os
#		break
	print ("running... %5d" % (i))
	i+=1
	time.sleep(1) # Allow a sleep time of 1 second to reduce CPU usage
