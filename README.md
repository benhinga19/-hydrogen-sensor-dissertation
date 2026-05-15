# Hydrogen Sensor Dissertation Project

Repository containing Arduino and MATLAB code developed for a dissertation project investigating hydrogen sensing technologies for hydrogen leak detection.

## Introduction

This repository contains the software developed for an undergraduate dissertation project investigating several low-cost hydrogen sensing methods, including MQ-8 metal oxide semiconductor (MOS), catalytic, and thermal conductivity sensors.

The software was used to acquire voltage data from sensors using an Arduino microcontroller and stream this data to MATLAB for real-time visualisation and storage. Experimental data collected using this software was later analysed in Microsoft Excel to compare sensor performance characteristics such as response behaviour, stability, and sensitivity.

## Contextual Overview

System architecture:

Hydrogen Sensor → Arduino Uno → Serial USB Communication → MATLAB → CSV Data Storage → Excel Data Analysis

The Arduino is responsible for reading analogue voltage signals from the sensors and transmitting the data over serial communication. MATLAB receives the serial data stream, plots the sensor response in real time, and stores the recorded data as CSV files for later processing and analysis.

## Main Files

* MQ8_arduino.ino
    * Reads analogue voltage from pin A0 every 100 ms.
    * Used for both MQ-8 and thermal conductivity sensor testing.
    * Streams serial data to MATLAB.
* Catalytic_arduino.ino
    * Reads catalytic sensor voltage every 500 ms.
    * Includes LED alarm functionality using digital pin 12.
    * Streams serial data to MATLAB.
* Matlab_code.m
    * Receives serial data from the Arduino.
    * Plots sensor voltage in real time.
    * Saves recorded data as CSV files for later analysis.
 
## Installation instructions

Required software:

* Arduino IDE
* MATLAB
* Microsoft Excel (optional for data analysis)

Hardware Requirements

* Arduino Uno
* Hydrogen sensor circuit
* USB cable
* Breadboard and supporting circuitry

Arduino Setup

1. Install the Arduino IDE.
2. Open the required .ino file.
3. Select the correct COM port and board type.
4. Upload the code to the Arduino.

MATLAB Setup

1. Open Matlab_code.m.
2. Serial COM port should be selected automatically.
3. Run the MATLAB script after the Arduino begins transmitting serial data.

How to Run the Software

1. Connect the sensor circuit to the Arduino.
2. Connect the Arduino to the computer via USB.
3. Upload the required Arduino program.
4. Start the MATLAB script.
5. Observe the real-time voltage plot.
6. Stop the MATLAB script to automatically save the recorded data as a CSV file.

Sampling Rates

* MQ-8 / Thermal conductivity sensor: 100 ms sampling interval
* Catalytic sensor: 500 ms sampling interval

## Author

Benjamin Hinga

University dissertation project

## Notes

ChatGPT was used to assist with generating initial code for MATLAB serial data streaming and some basic Arduino functions, particularly in areas unfamiliar to the author. The generated code was subsequently reviewed, adapted, tested, and validated within the project to ensure correct operation and suitability for the experimental setup.
