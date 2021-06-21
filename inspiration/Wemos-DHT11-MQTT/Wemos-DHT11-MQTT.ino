/*
  SimpleMQTTClient.ino
  The purpose of this exemple is to illustrate a simple handling of MQTT and Wifi connection.
  Once it connects successfully to a Wifi network and a MQTT broker, it subscribe to a topic and send a message to it.
  It will also send a message delayed 5 seconds later.
*/

#include "EspMQTTClient.h"
#include "DHTesp.h"
#include "ArduinoJson.h"

const String DEVICENAME="TestWemosDHT11Sensor";

EspMQTTClient client(
  "oort",
  "heliopause",
  "192.168.1.200",  // MQTT Broker server ip
  "nodeadmin",   // Can be omitted if not needed
  "asdfmzionm",   // Can be omitted if not needed
  "TestClient",     // Client name that uniquely identify your device
  1883              // The MQTT port, default to 1883. this line can be omitted
);


DHTesp dht;

unsigned long previousMillis = 0;        // will store last time the sensor was read
const long interval = 2000;           // interval at which to read sensor (milliseconds)

void setup()
{
  Serial.begin(115200);

  // Optionnal functionnalities of EspMQTTClient :
  client.enableDebuggingMessages(); // Enable debugging messages sent to serial output
  client.enableHTTPWebUpdater(); // Enable the web updater. User and password default to values of MQTTUsername and MQTTPassword. These can be overrited with enableHTTPWebUpdater("user", "password").
  client.enableLastWillMessage("TestClient/lastwill", "I am going offline");  // You can activate the retain flag by setting the third parameter to true

  // DHT sensor bit
  Serial.println();
  Serial.println("Status\tHumidity (%)\tTemperature (C)\t(F)\tHeatIndex (C)\t(F)");
  dht.setup(14, DHTesp::DHT11); // Connect DHT sensor to GPIO 17
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
  client.loop();
  // dht bit needs to avoid using the delay method because that would break the webserver i should think. I'm not going to check.
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    float humidity = dht.getHumidity();
    float temperature = dht.getTemperature();

    // jSON bit... seems a bit convoluted to start with
    StaticJsonDocument<512> JSONpayload;
    JsonObject JSONencoder = JSONpayload.as<JsonObject>(); 
    JSONpayload["DeviceName"] = DEVICENAME;
    JSONpayload["Temperature"] = temperature;
    JSONpayload["Humidity"] = humidity;

    char JSONmessageBuffer[512];
    serializeJson(JSONpayload, JSONmessageBuffer);
    client.publish("mytopic/test", JSONmessageBuffer); // You can activate the retain flag by setting the third parameter to true
    Serial.println("Message sent to MQTT topic..");
    Serial.println(JSONmessageBuffer);

    
    //    Serial.print(dht.getStatusString());
    //
    //    Serial.print(humidity, 1);
    //
    //    Serial.print(temperature, 1);
    //
    //    Serial.print(dht.computeHeatIndex(temperature, humidity, false), 1);

  }
}
