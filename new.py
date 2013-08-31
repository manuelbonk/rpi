#!/usr/bin/python
import RPi.GPIO as GPIO
import time

# Variable counter definieren
counter = 0

# SoC als Pinreferenz waehlen
GPIO.setmode(GPIO.BOARD)  

# Pin 24 vom SoC als Input deklarieren und Pull-Down Widerstand aktivieren
GPIO.setup(7, GPIO.IN)

# ISR
def Interrupt(channel):  
	# Zugriff auf globale Variablen
	global counter

	# counter um eins erhoehen und ausgeben
	counter =+ 1
	print ("counter \3d" % counter)
						
# Interrupt Event hinzufuegen. Pin 24, auf steigende Flanke reagieren und ISR "Interrupt" deklarieren
GPIO.add_event_detect(7, GPIO.RISING, callback = Interrupt, bouncetime = 200)   
						  
# Endlosschleife
while True:
 	time.sleep(1)
