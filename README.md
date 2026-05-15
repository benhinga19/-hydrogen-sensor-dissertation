# -hydrogen-sensor-dissertation
Repository of Arduino and Matlab code for hydrogen sensing

This repository contains Arduino and MATLAB code used for my dissertation project investigating hydrogen sensing technologies

MQ-8_arduino.ino is arduino code to read voltage into analogue pin 0 (A0) every 100 ms. This code was also used for thermal conductivity sensor. No LED alarm functionality built in. Data streamed across to laptop for Matlab script.

Catalytic_arduino.ino is arduino code for catalytic sensor only, refreshing every 500 ms. LED alarm funtionality built in to go off when hydrogen is detected. LED is across digital pin 12 and GND. Voltage read from analogue pin 0 (A0). Data streamed across to laptop for Matlab script.

Matlab_code.m is matlab code to recieve data from arduino. This data is then plotted and finally when the code is exited, the data is saved as a .csv file to be opened in Microsoft Excel for data analysis.
