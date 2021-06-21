/*
  Stupid Solar Thing

  Solar Powered sensor platform

  Current version DHT22 and Capacitive moisture sensor

  Rob Lloyd. June 2021.

The whole of the OTA part of this project ise based on: https://github.com/SensorsIot/ESP32-OTA

*/

// START OTA IMPORTS
//#define ESP32_RTOS  // Uncomment this line if you want to use the code with freertos only on the ESP32
                    // Has to be done before including "OTA.h"

#include "OTA.h"
#include <credentials.h>

uint32_t entry;
//END OTA IMPORTS

// Import required libraries
#include <ESP8266WiFi.h>
#include <WebSocketsServer.h>
//#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <Hash.h>
#include <ESPAsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include <FS.h>

#include "DHTesp.h"

// Create AsyncWebServer object on port 80
AsyncWebServer server(80);
WebSocketsServer webSocket = WebSocketsServer(81);

// Replace with your network credentials
const char* ssid = "oort";
const char* password = "heliopause";

// Set GPIO pins
const int ledPin = 2;

// Stores LED state
String ledState;

// Instantiate the DHT sensor
DHTesp dht;
// Variables for the DHT sensor
const int MoistureSensorPin = A0;
int soilMoistureValue = 0;
const int AirValue = 1024;   
const int WaterValue = 650;

// Generally, you should use "unsigned long" for variables that hold time
// The value will quickly become too large for an int to store
unsigned long previousMillis = 0;        // will store last time LED was updated

// constants won't change:
const long interval = 2000;           // interval at which to blink (milliseconds)

// Variables to recieve a new message byte by byte as a string of text
String inputString = "";         // a String to hold incoming data
bool stringComplete = false;  // whether the string is complete

int newMessage;
bool commandRecieved = false;

void webSocketEvent(uint8_t num, WStype_t type, uint8_t * payload, size_t length) {
    switch(type) {
        case WStype_DISCONNECTED:
            Serial.printf("[%u] Disconnected!\n", num);
            break;
        case WStype_CONNECTED: {
            IPAddress ip = webSocket.remoteIP(num);
            Serial.printf("[%u] Connected from %d.%d.%d.%d url: %s\n", num, ip[0], ip[1], ip[2], ip[3], payload);

            // send message to client
            webSocket.sendTXT(num, "Connected");
        }
            break;
        case WStype_TEXT:
            Serial.printf("[%u] get Text: %s\n", num, payload);

            // """
            // https://forum.arduino.cc/t/how-to-convert-uint8_t-to-integer/640239/3
            //   // Callback: receiving any WebSocket message
            //   void onWebSocketEvent(uint8_t client_num, WStype_t type, uint8_t * payload, size_t length)
            //   {
            //       for ( size_t i = 0; i < length; i++ )
            //       {
            //           Serial.println( payload[i] );
            //       }
            //   }
            // """
            
            // //were uint32_t
            // //uint32_t move = (uint32_t) strtol((const char *) &payload[0], NULL, 16);
            // uint32_t move = (uint32_t) strtol((const char *) &payload, NULL, 16);
            newMessage = (int)strtol((const char *) &payload, NULL, 16);
            Serial.printf("There is a new command: %s\n", newMessage); // Parrot the message back  
            commandRecieved = true; // We have a message! It's dealt with in the main loop  
            inputString = ""; //Reset the input string, ready for the next message
            break;
    }
}

void setup() {
  Serial.begin(115200);
  Serial.println("Booting");

  // deal with Over-The-Air updates if necessary
  setupOTA("stupid-solar-thing-prototype", mySSID, myPASSWORD);

  // Your setup code
  pinMode(ledPin, OUTPUT);
  pinMode(MoistureSensorPin, INPUT);

  // Initialise DHT sensor
  dht.setup(5, DHTesp::DHT22); // Connect DHT sensor to GPIO 17

  // Initialize SPIFFS
  if(!SPIFFS.begin()){
    Serial.println("An Error has occurred while mounting SPIFFS");
    return;
  }

  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

    // start webSocket server
    webSocket.begin();
    webSocket.onEvent(webSocketEvent);

    // yes, whaterver MDNS magic does, lets start that too
    if(MDNS.begin("esp8266")) {
        Serial.println("MDNS responder started");
    }

  // Print ESP Local IP Address
  Serial.println(WiFi.localIP());

  // Route for root / web page
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
//    request->send(SPIFFS, "/index.html", String(), false, processor);
    request->send(SPIFFS, "/index.html", "text/html");
  });

  // Route to load p5.min.js file
  server.on("/p5.min.js", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/p5.min.js", "application/javascript");
  });

    // Route to load p5.dom.min.js file
  server.on("/p5.dom.min.js", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/p5.dom.min.js", "application/javascript");
  });

    // Route to load p5.sound.min.js file
  server.on("/p5.sound.min.js", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/p5.sound.min.js", "application/javascript");
  });

  // Route to load p5.sound.min.js file
  server.on("/sketch.js", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/sketch.js", "application/javascript");
  });
  
  // Route to load style.css file
  server.on("/style.css", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/style.css", "text/css");
  });

  // Start server
  server.begin();

      // Add service to MDNS
    MDNS.addService("http", "tcp", 80);
    MDNS.addService("ws", "tcp", 81);
  
  // OK, thats the server / communication bit done. lets get on with 
  // talking to the sensors
  // DHT sensor bit
  TelnetStream.println();
  TelnetStream.println("Status\tHum(%)\t(C)\t\t(F)\tHI\t(C)\t\t(F)\t\tMoist");
  
}

void loop() {

    // Deal with Over-The-Air updates if necessary
  entry = micros();
#ifdef defined(ESP32_RTOS) && defined(ESP32)
#else // If you do not use FreeRTOS, you have to regulary call the handle method.
  ArduinoOTA.handle();
#endif
  TelnetStream.println(micros()-entry);
  TelnetStream.println("Loop");
  delay(1000);
  // Your code here
  // Websocket Stuff
    webSocket.loop();
    //server.handleClient();

  // dht bit needs to avoid using the delay method because that would break the webserver i should think. I'm not going to check.
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    soilMoistureValue = analogRead(MoistureSensorPin);  //put Sensor insert into soil
    float humidity = dht.getHumidity();
    float temperature = dht.getTemperature();
    TelnetStream.print(dht.getStatusString());
    TelnetStream.print("\t\t");
    TelnetStream.print(humidity, 1);
    TelnetStream.print("\t");
    TelnetStream.print(temperature, 1);
    TelnetStream.print("\t");
    TelnetStream.print(dht.toFahrenheit(temperature), 1);
    TelnetStream.print("\t\t");
    TelnetStream.print(dht.computeHeatIndex(temperature, humidity, false), 1);
    TelnetStream.print("\t");
    TelnetStream.print(dht.computeHeatIndex(dht.toFahrenheit(temperature), humidity, true), 1);
    TelnetStream.print("\t");
    TelnetStream.println(soilMoistureValue);
  }  
}