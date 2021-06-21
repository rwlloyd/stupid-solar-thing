/*-
 * This example demonstrates how to read analog signals.
 *
 * It assumes there are potentiometers connected to the 16 channels of the
 * 74HC4067 mux.
 * 
 * ------------------------------------------------------------
 * Project: arduino-ad-mux-lib
 * Source: https://github.com/stechio/arduino-ad-mux-lib.git
 *
 * Author: Nick Lamprianidis (adaptation by Stefano Chizzolini)
 */

#include <Arduino.h>
#include "Mux.h"

using namespace admux;

int numberOfSensors = 2;
int sensorReadings[] = {0, 0};

/*
 * Creates a Mux instance.
 *
 * 1st argument is the SIG (signal) pin (Arduino analog input pin A0).
 * 2nd argument is the S0-S3 (channel control) pins (Arduino pins 8, 9, 10, 11).
 */
Mux mux(Pin(A0, INPUT, PinType::Analog), Pinset(2,3));

void setup() {
  // Serial port initialization.
  Serial.begin(9600); while (!Serial) /* Waits for serial port to connect (needed for Leonardo only) */;
}

/**
 * Reads the 16 channels and reports on the serial monitor the corresponding
 * value read by the A/D converter.
 */
void loop() {
  int data;
  //for (byte i = 0; i < mux.channelCount(); i++) {
  for (int i = 0; i < numberOfSensors; i++) {
    data = mux.read(i) /* Reads from channel i (returns a value from 0 to 1023) */;
    //Serial.print(i); Serial.print(",");Serial.println(data); 
    //Serial.print("Potentiometer at channel "); Serial.print(i); Serial.print(" is at "); Serial.print((double) (data) * 100 / 1023); Serial.println("%%");
    sensorReadings[i] = data;
  }
  for (int i = 0; i < numberOfSensors; i++) {
    Serial.print(sensorReadings[i]);Serial.print(",");
  }
  Serial.println();

  delay(500);
}
