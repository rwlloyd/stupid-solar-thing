/*
  SimpleMQTTClient.ino
  The purpose of this exemple is to illustrate a simple handling of MQTT and Wifi connection.
  Once it connects successfully to a Wifi network and a MQTT broker, it subscribe to a topic and send a message to it.
  It will also send a message delayed 5 seconds later.
*/
// START OTA IMPORTS
//#define ESP32_RTOS  // Uncomment this line if you want to use the code with freertos only on the ESP32
// Has to be done before including "OTA.h"

#include "OTA.h"
#include <credentials.h>

uint32_t entry;
//END OTA IMPORTS

#include "EspMQTTClient.h"
#include "DHTesp.h"
#include "ArduinoJson.h"

// Replace with your network credentials
const char* ssid = mySSID;
const char* password = myPASSWORD;

const String DEVICENAME = "sst-dht22-cmoist";

EspMQTTClient client(
  ssid,
  password,
  "192.168.1.200",  // MQTT Broker server ip
  "nodeadmin",   // Can be omitted if not needed
  "asdfmzionm",   // Can be omitted if not needed
  "sst-proto",     // Client name that uniquely identify your device
  1883              // The MQTT port, default to 1883. this line can be omitted
);

// Set GPIO pins
//const int ledPin = 2;
const int checkBatteryPin = 2;
const int dht22Pin = 5;
const int checkLightPin = 0;
const int checkMoisturePin = 4;

// Instantiate the DHT sensor
DHTesp dht;

int rawBatteryVoltage = 0;
int batPreviousMillis = 0;
int batInterval = 500; // Give the battery voltage 0.5 seconds to settle

int lightPreviousMillis = 0;
int lightInterval = 750;
int lightValue = 0;

// Variables for the Capacitive sensor
const int AirValue = 1024;
const int WaterValue = 650;
float soilMoisture = 0;

int moistPreviousMillis = 0;
int moistInterval = 1000; // Give the sensor voltage 0.5 seconds to settle

unsigned long previousMillis = 0;        // will store last time the sensor was read
const long interval = 2000;           // interval at which to read sensor (milliseconds)

bool sleepOnNextLoop = false;

void setup()
{
  Serial.begin(115200);
  Serial.println("Booting");

  // deal with Over-The-Air updates if necessary
  setupOTA("stupid-solar-thing-prototype", mySSID, myPASSWORD);

    // Your setup code
  //pinMode(ledPin, OUTPUT);
  pinMode(A0, INPUT);
  pinMode(checkBatteryPin, OUTPUT);
  pinMode(dht22Pin, INPUT);
  pinMode(checkLightPin, OUTPUT);
  pinMode(checkMoisturePin, OUTPUT);

  // Initialise DHT sensor
  dht.setup(dht22Pin, DHTesp::DHT22); // Connect DHT sensor to ESP8266 GPIO 17(?)

  // Optionnal functionnalities of EspMQTTClient :
  client.enableDebuggingMessages(); // Enable debugging messages sent to serial output
  client.enableHTTPWebUpdater(); // Enable the web updater. User and password default to values of MQTTUsername and MQTTPassword. These can be overrited with enableHTTPWebUpdater("user", "password").
  client.enableLastWillMessage("TestClient/lastwill", "I am going offline");  // You can activate the retain flag by setting the third parameter to true
}

// This function is called once everything is connected (Wifi and MQTT)
// WARNING : YOU MUST IMPLEMENT IT IF YOU USE EspMQTTClient
void onConnectionEstablished()
{
  //  // Subscribe to "mytopic/test" and display received message to Serial
  //  client.subscribe("mytopic/test", [](const String & payload) {
  //    Serial.println(payload);
  //  });
  //
  //  // Subscribe to "mytopic/wildcardtest/#" and display received message to Serial
  //  client.subscribe("mytopic/wildcardtest/#", [](const String & topic, const String & payload) {
  //    Serial.println(topic + ": " + payload);
  //  });
  //
  //  // Publish a message to "mytopic/test"
  //  client.publish("mytopic/test", "This is a message"); // You can activate the retain flag by setting the third parameter to true
  //
  //  // Execute delayed instructions
  //  client.executeDelayed(5 * 1000, []() {
  //    client.publish("mytopic/test", "This is a message sent 5 seconds later");
  //  });
}

void loop()
{
  // Deal with Over-The-Air updates if necessary
#ifdef defined(ESP32_RTOS) && defined(ESP32)
#else // If you do not use FreeRTOS, you have to regulary call the handle method.
  ArduinoOTA.handle();
#endif

  // check all the sensors
  float humidity = dht.getHumidity();
  float temperature = dht.getTemperature();
  checkSensor(1);
  checkSensor(2);
  checkSensor(3);
  // for (int i=0; i<3; i++) {
  //   checkSensor([i]);
  // }

  // loop the mqtt client
  client.loop(); 

  // If we have readings, let's publish the to the mqtt broker
  if (rawBatteryVoltage >= 1 && soilMoisture >= 1 && lightValue >= 1){
    // jSON bit... seems a bit convoluted to start with
    StaticJsonDocument<512> JSONpayload;
    JsonObject JSONencoder = JSONpayload.as<JsonObject>();
    JSONpayload["DeviceName"] = DEVICENAME;
    JSONpayload["Temperature"] = temperature;
    JSONpayload["Humidity"] = humidity;
    JSONpayload["SoilMoisture"] = soilMoisture;
    JSONpayload["LightValue"] = lightValue;
    JSONpayload["BatteryVoltage"] = rawBatteryVoltage;

    char JSONmessageBuffer[512];
    serializeJson(JSONpayload, JSONmessageBuffer);
    client.publish("/sensor/sst-proto", JSONmessageBuffer); // You can activate the retain flag by setting the third parameter to true
    TelnetStream.println("Message sent to MQTT topic..");
    Serial.println("Message sent to MQTT topic..");
    TelnetStream.println(JSONmessageBuffer);
    Serial.println(JSONmessageBuffer);
    sleepOnNextLoop = true;
    }
    
  if (sleepOnNextLoop){
    ESP.deepSleep(10e6); // Deep sleep for 30s
  }
}

void checkSensor(int sensor){
  if (sensor == 0){
    digitalWrite(checkBatteryPin, HIGH);
    unsigned long batCurrentMillis = millis();
    if (batCurrentMillis - batPreviousMillis >= batInterval) {
      batPreviousMillis = batCurrentMillis;
      rawBatteryVoltage = analogRead(A0);
    }
    digitalWrite(checkBatteryPin, LOW);  
  } 
  else if (sensor == 1){
    digitalWrite(checkMoisturePin, HIGH);
    unsigned long moistCurrentMillis = millis();
    if (moistCurrentMillis - moistPreviousMillis >= moistInterval) {
      moistPreviousMillis = moistCurrentMillis;
      int soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
      soilMoisture = map(soilMoistureValue, AirValue, WaterValue, 0, 100);
    }
    digitalWrite(checkMoisturePin, LOW);
  } 
  else if (sensor == 2){
    digitalWrite(checkLightPin, HIGH);
    unsigned long lightCurrentMillis = millis();
    if (lightCurrentMillis - lightPreviousMillis >= lightInterval) {
      lightPreviousMillis = lightCurrentMillis;
      lightValue = analogRead(A0);
    }
    digitalWrite(checkLightPin, LOW);
  }
}
