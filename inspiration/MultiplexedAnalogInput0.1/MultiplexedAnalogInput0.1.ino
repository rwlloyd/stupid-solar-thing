/*
  Multiplexing an Analog Input
*/

// assign sensor pins
int enableSensor0 = 2;
int enableSensor1 = 3;

int sensorPin = A0;    // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
int sensor0Val = 0;  // variable to store the value coming from the sensor
int sensor1Val = 0;

unsigned long previousMillis = 0;        // will store last time the sensor was read
const long interval = 500;           // interval at which to read sensor (milliseconds)
const long settleTime = 250;

Sensor Moisture(enableSensor0, 20, 250);
//Mositure Sensor(enableSensor0, 0, 250);

void setup() {

  Serial.begin(115200);
}

void loop() {
  // Sanity check. Make sure all the sensors are off
  digitalWrite(enableSensor0, LOW);
  digitalWrite(enableSensor1, LOW);
  /// This is a number that will update frequently with the clock
  unsigned long currentMillis = millis();
  // if we're in our first sensing period
  if (currentMillis - previousMillis >= 0 && currentMillis - previousMillis <= interval) {
    //Turn the sensor on
    digitalWrite(enableSensor0, HIGH);
    // Wait for the sensor to stabilise
    if (currentMillis - previousMillis >= interval + settleTime) {
      // read from the sensor
      sensor0Val = analogRead(sensorPin);
      digitalWrite(enableSensor0, LOW);
  Serial.println(sensor0Val, sensor1Val);
}

class Sensor
{
  // Class Member Variables
  // These are initialized at startup
  int sensorPin;      // the number of the LED pin
  long OnTime;     // milliseconds of on-time
  long SettleTime; // milliseconds to wait for settle
  long OffTime;    // milliseconds of off-time

  // These maintain the current state
  int sensorState;                 // ledState used to set the LED
  unsigned long previousMillis;   // will store last time LED was updated

  // Constructor - creates a Flasher 
  // and initializes the member variables and state
  public:
  Sensor(int pin, long on, long off)
  {
  sensorPin = pin;
  pinMode(sensorPin, OUTPUT);     
    
  OnTime = on;
  OffTime = off;
  
  sensorState = LOW; 
  previousMillis = 0;
  }

  void Update()
  {
    // check to see if it's time to change the state of the LED
    unsigned long currentMillis = millis();
     
    if((sensorState == HIGH) && (currentMillis - previousMillis >= OnTime))
    {
      sensorState = LOW;  // Turn it off
      previousMillis = currentMillis;  // Remember the time
      digitalWrite(sensorPin, sensorState);  // Update the actual LED
    }
    else if ((sensorState == LOW) && (currentMillis - previousMillis >= OffTime))
    {
      sensorState = HIGH;  // turn it on
      previousMillis = currentMillis;   // Remember the time
      digitalWrite(sensorPin, sensorState);   // Update the actual LED
    }
  }
};
