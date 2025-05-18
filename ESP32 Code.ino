#include <WiFi.h>
#include <HTTPClient.h>
#include "DHT.h"

#define DHTPIN 4
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

const char* ssid = "Galaxy M519D02";
const char* password = "Harson2016";
const char* thingspeak = "http://api.thingspeak.com/update";

void setup() {
  Serial.begin(115200);
  dht.begin();
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) delay(500);
}

void loop() {
  float temp = dht.readTemperature();
  float hum = dht.readHumidity();
  int soil_moisture = analogRead(35); // GPIO35
  //int soilMoisturePercentage = map(soil_moisture, 0, 4095, 0, 100);
  
  if (isnan(temp) || isnan(hum)) return;

  String url = String(thingspeak) + "?api_key=UA40UJUZM09Y5UD0" +
               "&field1=" + String(temp) +
               "&field2=" + String(hum) +
               "&field3=" + String(soil_moisture);

  int soilMoisturePercentage = map(soil_moisture, 0, 4095, 0, 100);

  Serial.print("Temperature :");
  Serial.print(temp);
  Serial.print("| Humidity :");
  Serial.print(hum);
  Serial.print("/n Soil Moisture (Analog Value): ");
  Serial.print(soil_moisture);
  Serial.print(" | Soil Moisture (%): ");
  Serial.println(soilMoisturePercentage);

  HTTPClient http;
  http.begin(url);
  int code = http.GET();
  http.end();
  
  delay(20000); // 30-minute interval
}
