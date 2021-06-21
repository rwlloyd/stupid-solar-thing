/*
  Multiplexing an Analog Input

  I've tried to be clever. now I'm going to try to be verbose.
  I'm just going to do everything in 500ms intervals to start with.
  |--1--|--2--|--3--|--4--|--5--|
  |s1-on|s1-rd|s1-of|
  |-----|-----|s1-on|s1-rd|s1-of|
*/

// Dear User, you're not responsible for much, but make sure this section is correct
int numberSensors = 2;              // How many senors are there?
int SensorSelectPins[] = {2, 3};    // Which digital pins are they powered by?
const long onTime = 500;            // How long does it take the sensor to turn on?
const long readTime = 500;          // length of time the sensor is left on for (milliseconds)
int InputPin = A0;                  // The name of the analog pin

/// Below here be dragons.
bool SensorChecked[] = {false, false};
int SensorReadings[] = { -1, -1};
unsigned long lastMillis = 0;        // will store last time the sensor was read

void setup() {
  Serial.begin(115200);
  pinMode(InputPin, INPUT);
  for (int i = 0; i < numberSensors; i++) {
    pinMode(SensorSelectPins[i], OUTPUT);
  }
}

void loop() {
  /// This is a number that will update frequently with the clock
  unsigned long currentMillis = millis();
  // do something one at a time, like check a sensor?;
  for (int i = 0; i < numberSensors; i++) {
    if (currentMillis - lastMillis <= onTime) {
      lastMillis = currentMillis;
      //Turn the sensor on
      digitalWrite(SensorSelectPins[i], HIGH);
      // Wait for the sensor to stabilise
      if (currentMillis - lastMillis >= onTime) {
        lastMillis = currentMillis;
        // read from the sensor
        SensorReadings[i] = analogRead(InputPin);
        Serial.println(analogRead(InputPin));
        if (currentMillis - lastMillis >= (onTime + readTime)) {
          lastMillis = currentMillis;
          digitalWrite(SensorSelectPins[i], LOW);
        }
      }
    }
  }
  if (SensorReadings[numberSensors - 1] > 0) {
    Serial.println(SensorReadings[0], SensorReadings[1]);
  }

}
