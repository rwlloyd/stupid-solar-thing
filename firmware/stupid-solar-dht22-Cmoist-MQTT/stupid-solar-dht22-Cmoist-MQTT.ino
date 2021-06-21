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
const int ledPin = 2;

// Instantiate the DHT sensor
DHTesp dht;
// Variables for the Capacitive sensor
const int MoistureSensorPin = A0;
const int AirValue = 1024;
const int WaterValue = 650;

unsigned long previousMillis = 0;        // will store last time the sensor was read
const long interval = 10000;           // interval at which to read sensor (milliseconds)

void setup()
{
  Serial.begin(115200);
  Serial.println("Booting");

  // deal with Over-The-Air updates if necessary
  setupOTA("stupid-solar-thing-prototype", mySSID, myPASSWORD);

    // Your setup code
  pinMode(ledPin, OUTPUT);
  pinMode(MoistureSensorPin, INPUT);

  // Initialise DHT sensor
  dht.setup(5, DHTesp::DHT22); // Connect DHT sensor to ESP8266 GPIO 17(?)

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
  //entry = micros();
#ifdef defined(ESP32_RTOS) && defined(ESP32)
#else // If you do not use FreeRTOS, you have to regulary call the handle method.
  ArduinoOTA.handle();
#endif
  //TelnetStream.println(micros() - entry);
//  TelnetStream.println("Loop");
//  delay(1000);

  client.loop();
  // dht bit needs to avoid using the delay method because that would break the webserver i should think. I'm not going to check.
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;


    float humidity = dht.getHumidity();
    float temperature = dht.getTemperature();
    int soilMoistureValue = analogRead(MoistureSensorPin);  //put Sensor insert into soil
    float soilMoisture = map(soilMoistureValue, AirValue, WaterValue, 0, 100);

    // jSON bit... seems a bit convoluted to start with
    StaticJsonDocument<512> JSONpayload;
    JsonObject JSONencoder = JSONpayload.as<JsonObject>();
    JSONpayload["DeviceName"] = DEVICENAME;
    JSONpayload["Temperature"] = temperature;
    JSONpayload["Humidity"] = humidity;
    JSONpayload["SoilMoisture"] = soilMoisture;

    char JSONmessageBuffer[512];
    serializeJson(JSONpayload, JSONmessageBuffer);
    client.publish("/sensor/sst-proto", JSONmessageBuffer); // You can activate the retain flag by setting the third parameter to true
    TelnetStream.println("Message sent to MQTT topic..");
    TelnetStream.println(JSONmessageBuffer);

//    TelnetStream.print(dht.getStatusString());
//    TelnetStream.print("\t\t");
//    TelnetStream.print(humidity, 1);
//    TelnetStream.print("\t");
//    TelnetStream.print(temperature, 1);
//    TelnetStream.print("\t");
//    TelnetStream.print(dht.toFahrenheit(temperature), 1);
//    TelnetStream.print("\t\t");
//    TelnetStream.print(dht.computeHeatIndex(temperature, humidity, false), 1);
//    TelnetStream.print("\t");
//    TelnetStream.print(dht.computeHeatIndex(dht.toFahrenheit(temperature), humidity, true), 1);
//    TelnetStream.print("\t");
//    TelnetStream.println(soilMoistureValue);
  }
}
